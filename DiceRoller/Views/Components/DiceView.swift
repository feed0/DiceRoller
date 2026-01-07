//
//  DiceView.swift
//  DiceRoller
//
//  Created by Felipe Eduardo Campelo Ferreira Osorio on 05/01/26.
//

import SwiftUI

struct DiceView: View {
    
    // MARK: - Properties
    
    @State private var numberOfPips = 1
    
    // MARK: Constants
    private let maxSideSize: CGFloat = 150
    private let rangeOfPips: ClosedRange<Int> = 1...6
    
    // MARK: - Body
    
    public var body: some View {
        VStack {
            dieImage
            rollTheDieButton
        }
    }
    
    // MARK: - ViewBuilder
    
    private var dieImage: some View {
        Image(systemName: "die.face.\(numberOfPips)")
            .resizable()
            .frame(maxWidth: maxSideSize,
                   maxHeight: maxSideSize)
            .aspectRatio(1, contentMode: .fit)
    }
    
    private var rollTheDieButton: some View {
        Button("Roll") {
            withAnimation {
                numberOfPips = Int.random(in: rangeOfPips)
            }
        }
        .buttonStyle(.bordered)
    }
}

// MARK: - Preview

#Preview {
    DiceView()
}
