//
//  ContentView+ViewModel.swift
//  ShadyAlertExample
//
//  Created by John Shade on 22/08/25.
//

import Foundation
import SwiftUI
import ShadyAlert

//MARK: ExampleView+ViewModel
extension ExampleView {
    
    final class ViewModel: ShadyViewModel {
        
        @Published var showCountDownView = false {
            didSet {
                if oldValue != showCountDownView
                    && !showCountDownView {
                    
                    showKiddingAlert()
                }
            }
        }
    }
}

//MARK: ExampleView.ViewModel+Show Shady Alert
extension ExampleView.ViewModel {
    
    func showInfoAlert() {
        shadyAlert = ShadyAlert(type: .info, message: "Task failed successfully :)")
    }
    
    func showErrorAlert() {
        shadyAlert = ShadyAlert.withError(MyError.somethingWentWrong)
    }
    
    func showActionAlert() {
        shadyAlert = ShadyAlert(
            type: .actionAlert,
            title: "Make Your Choice",
            message: "Select an action:",
            actions: MyActionChoices.allCases
        )
    }
    
    func showConfirmeAllDeleteButton() {
        shadyAlert = ShadyAlert(
            type: .actionAlert,
            title: "Are You Sure?",
            message: "By pressing delete you will delete all",
            actions: DeleteAllActionChoices.allCases
        )
    }
    
    func showKiddingAlert() {
        shadyAlert = ShadyAlert(type: .info, message: "Ha ha, just kidding :)")
    }
}

//MARK: ExampleView.ViewModel+ShadyAlert Actions
extension ExampleView.ViewModel {
    
    func handleAlertAction(_ action: any ShadyAlertActionProtocol) {
        switch action {
        case let myAction as MyActionChoices:
            handleMyAction(myAction)
        case let deleteAction as DeleteAllActionChoices:
            handeDeleteAction(deleteAction)
        default:
            debugPrint("unmanaged shady action: \(action)")
        }
    }
    
    private func handeDeleteAction(_ action: DeleteAllActionChoices) {
        switch action {
        case .confirme:
            showCountDownView.toggle()
        case .cancel:
            return
        }
    }
    
    private func handleMyAction(_ action: MyActionChoices) {
        // temporary trick
        DispatchQueue.main.asyncAfter(deadline: .now() + alertDismissDelay) { [weak self] in
            guard let self = self else {
                return
            }
            
            switch action {
            case .failSuccessfully:
                showInfoAlert()
            case .showError:
                showErrorAlert()
            case .deleteAll:
                showConfirmeAllDeleteButton()
            case .cancel:
                return
            }
        }
    }
}
