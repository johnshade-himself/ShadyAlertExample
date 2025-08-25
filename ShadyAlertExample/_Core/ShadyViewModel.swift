//
//  ShadyViewModel.swift
//  ShadyAlertExample
//
//  Created by John Shade on 22/08/25.
//

import SwiftUI
import ShadyAlert

@MainActor
public class ShadyViewModel: ObservableObject {
    
    internal let alertDismissDelay: CGFloat = 0.1
    
    @Published internal var shadyAlert: ShadyAlert? {
        didSet {
            debugPrint("alert data is: \(shadyAlert == nil ? "nil" : "assigned")")
        }
    }
}
