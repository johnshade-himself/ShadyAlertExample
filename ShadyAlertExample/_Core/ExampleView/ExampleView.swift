//
//  ContentView.swift
//  ShadyAlertExample
//
//  Created by John Shade on 22/08/25.
//

import SwiftUI
import ShadyAlert

struct ExampleView: View {
    
    @StateObject private var vm = ViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                
                Button {
                    vm.showInfoAlert()
                } label: {
                    Text("Show Info Alert")
                }
                
                Button {
                    vm.showErrorAlert()
                } label: {
                    Text("Show Error Alert")
                }
                
                Button {
                    vm.showActionAlert()
                } label: {
                    Text("Show Action Alert")
                }
            }
            .navigationTitle("Aler Example View")
            .fullScreenCover(isPresented: $vm.showCountDownView) {
                DeletingCountDown()
            }
            .shadyAlert(item: $vm.shadyAlert, onAction: vm.handleAlertAction)
        }
    }
}

#Preview {
    ExampleView()
}
