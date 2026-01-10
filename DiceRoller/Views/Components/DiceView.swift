//
//  DiceView.swift
//  DiceRoller
//
//  Created by Felipe Eduardo Campelo Ferreira Osorio on 05/01/26.
//

import SwiftUI

struct DiceView: View {
    
    // MARK: - Properties
    
    // MARK: Parameters
    @State private var numberOfPips = 1
    
    // MARK: Constants
    private let maxSideSize: CGFloat = 150
    private let rangeOfPips: ClosedRange<Int> = 1...6
    
    // MARK: - Body
    
    public var body: some View {
        dieImage
    }
    
    // MARK: - ViewBuilder
    
    private var dieImage: some View {
        Image(systemName: "die.face.\(numberOfPips).fill")
            .resizable()
            .frame(maxWidth: maxSideSize,
                   maxHeight: maxSideSize)
            .aspectRatio(1, contentMode: .fit)
            .foregroundStyle(.black, .white)
        
            /// On tap
            .onTapGesture {
                withAnimation {
                    numberOfPips = Int.random(in: rangeOfPips)
                }
            }
    }
}

// MARK: - Preview

#Preview {
    DiceView()
}
