//
//  DiceView.swift
//  DiceRoller
//
//  Created by Felipe Eduardo Campelo Ferreira Osorio on 05/01/26.
//

import SwiftUI

struct DiceView: View {
    
    // MARK: - Properties
    
    var numberOfPips = 1
    
    private let maxSideSize: CGFloat = 150
    private let rangeOfPips: ClosedRange<Int> = 1...6
    
    // MARK: - Body
    
    public var body: some View {
        VStack {
            Image(systemName: "die.face.\(numberOfPips)")
                .resizable()
                .frame(maxWidth: maxSideSize,
                       maxHeight: maxSideSize)
            
            Button("Roll") {
                numberOfPips = Int.random(in: rangeOfPips)
            }
        }
    }
}

// MARK: - Preview

#Preview {
    DiceView()
}
