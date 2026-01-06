//
//  ContentView.swift
//  DiceRoller
//
//  Created by Felipe Eduardo Campelo Ferreira Osorio on 05/01/26.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    
    @State private var diceCount = 2
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 16) {
            title
            diceHStack
            
            HStack {
                removeDieButton
                addDieButton
            }
        }
        .padding()
    }
    
    // MARK: - ViewBuilder
    
    private var title: some View {
        Text("Dice Roller")
            .font(.largeTitle
                .lowercaseSmallCaps()
                .bold()
                .monospaced())
    }
    
    private var diceHStack: some View {
        HStack {
            ForEach(1...diceCount, id: \.description) { _ in
                DiceView()
            }
        }
    }

    // MARK: Buttons
    
    private var removeDieButton: some View {
        Button("Remove Die") {
            withAnimation {
                diceCount -= 1
            }
        }
        .disabled(diceCount == 1)
    }
    
    private var addDieButton: some View {
        Button("Add Die") {
            withAnimation {
                diceCount += 1
            }
        }
        .disabled(diceCount == 3)
    }
}

#Preview {
    ContentView()
}
