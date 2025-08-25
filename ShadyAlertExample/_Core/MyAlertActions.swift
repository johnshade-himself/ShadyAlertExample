//
//  MyActionChoices.swift
//  ShadyAlertExample
//
//  Created by John Shade on 22/08/25.
//
import SwiftUI
import ShadyAlert

enum MyActionChoices: ShadyAlertActionProtocol {
    case failSuccessfully
    case showError
    case cancel
    case deleteAll
    
    var id: UUID {
        UUID()
    }
    
    var title: String {
        switch self {
        case .failSuccessfully:
            "Fail Successfully"
        case .showError:
            "Just Fail"
        case .cancel:
            "Cancel"
        case .deleteAll:
            "Delete All"
        }
    }
    
    var role: ButtonRole? {
        switch self {
        case .cancel:
            .cancel
        case .deleteAll:
            .destructive
        default:
            nil
        }
    }
    
}

enum DeleteAllActionChoices: ShadyAlertActionProtocol {
    case cancel
    case confirme
    
    var id: UUID {
        UUID()
    }
    
    var title: String {
        switch self {
        case .cancel:
            "Cancel"
        case .confirme:
            "Confirme"
        }
    }
    
    var role: ButtonRole? {
        switch self {
        case .cancel:
            .cancel
        case .confirme:
            .destructive
        }
    }
}
