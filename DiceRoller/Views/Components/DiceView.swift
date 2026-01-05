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
    
    // MARK: - Body
    
    public var body: some View {
        Image(systemName: "die.face.\(numberOfPips)")
            .resizable()
            .frame(maxWidth: maxSideSize,
                   maxHeight: maxSideSize)
    }
}

// MARK: - Preview

#Preview {
    DiceView()
}
