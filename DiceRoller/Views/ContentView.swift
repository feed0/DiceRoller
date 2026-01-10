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
            Spacer()
            diceHStack
            Spacer()
            buttonsHStack
        }
        .padding()
        .frame(maxWidth: .infinity,
               maxHeight: .infinity)
        .background(.appBackground)
        .tint(.white)
    }
    
    // MARK: - ViewBuilder
    
    private var title: some View {
        Text("Dice Roller")
            .font(.largeTitle
                .lowercaseSmallCaps()
                .bold()
                .monospaced())
            .foregroundStyle(.white)
    }
    
    private var diceHStack: some View {
        HStack {
            ForEach(1...diceCount, id: \.description) { _ in
                DiceView()
            }
        }
    }

    // MARK: Buttons
    
    private var buttonsHStack: some View {
        HStack {
            removeDieButton
            addDieButton
        }
        .labelStyle(.iconOnly)
        .font(.title)
    }
    
    private var removeDieButton: some View {
        Button("Remove Die", systemImage: "minus.circle.fill") {
            withAnimation {
                diceCount -= 1
            }
        }
        .disabled(diceCount == 1)
        .symbolRenderingMode(.hierarchical)
    }
    
    private var addDieButton: some View {
        Button("Add Die", systemImage: "plus.circle.fill") {
            withAnimation {
                diceCount += 1
            }
        }
        .disabled(diceCount == 5)
    }
}

#Preview {
    ContentView()
}
