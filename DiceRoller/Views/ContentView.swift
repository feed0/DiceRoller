//
//  ContentView.swift
//  DiceRoller
//
//  Created by Felipe Eduardo Campelo Ferreira Osorio on 05/01/26.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    
    @State private var diceModelList = [
        DieModel(totalSides: .four),
        DieModel(totalSides: .eight),
        DieModel(totalSides: .twelve),
        DieModel(totalSides: .twenty),
    ]
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 16) {
            title
            Spacer()
            
            ScrollView(.horizontal) {
                HStack {
                    diceForEeach
                }
            }
            
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
    
    private var diceForEeach: some View {
        ForEach(diceModelList) { dieModel in
            DieView(dieModel: dieModel)
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
            handleRemoveDieButton()
        }
        .disabled(diceModelList.count == 1)
        .symbolRenderingMode(.hierarchical)
    }
    
    private var addDieButton: some View {
        Button("Add Die", systemImage: "plus.circle.fill") {
            handleAddDieButton()
        }
        .disabled(diceModelList.count == 4)
    }
    
    // MARK: - Private funcs
    
    /// Pops the last die from `diceModelList`,
    /// down to a minumum of 1 die
    private func handleRemoveDieButton() {
        withAnimation {
            _ = diceModelList.popLast()
        }
    }
    
    /// Adds a new die with a higher `totalSides` than the previous one,
    /// up to a maximun of 4 dice
    private func handleAddDieButton() {
        var nextDie: DieModel!
        
        switch diceModelList.count {
        case 1:
            nextDie = DieModel(totalSides: .eight)
        case 2:
            nextDie = DieModel(totalSides: .twelve)
        case 3:
            nextDie = DieModel(totalSides: .twenty)
        default:
            nextDie = DieModel(totalSides: .four)
        }
        
        withAnimation {
            diceModelList.append(nextDie)
        }
    }
}

#Preview {
    ContentView()
}
