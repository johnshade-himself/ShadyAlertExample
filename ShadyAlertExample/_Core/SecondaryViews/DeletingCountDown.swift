//
//  CountdownFullScreen.swift
//  ShadyAlertExample
//
//  Created by John Shade on 22/08/25.
//


import SwiftUI

struct DeletingCountDown: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var counter = 5
    @State private var timer: Timer?

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack {
                Text("Deleting in:")
                
                Text("\(counter)")
                    .transition(.scale.combined(with: .opacity))
                    .id(counter)
            }
            .font(.system(size: 80, weight: .bold, design: .rounded))
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
        }
        .onAppear {
            startCountdown()
        }
        .onDisappear {
            timer?.invalidate()
        }
    }

    private func startCountdown() {
        timer?.invalidate()
        counter = 5
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { t in
            if counter > 0 {
                withAnimation {
                    counter -= 1
                }
            } else {
                t.invalidate()
                DispatchQueue.main.async {
                    dismiss()
                }
            }
        }
    }
}
