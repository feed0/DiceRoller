//
//  DiceView.swift
//  DiceRoller
//
//  Created by Felipe Eduardo Campelo Ferreira Osorio on 05/01/26.
//

import SwiftUI

struct DieView: View {
    
    // MARK: - Properties
    
    // MARK: Parameters
    @State private var dieModel: DieModel

    // MARK: Constants
    private let maxSideSize: CGFloat = 150
    
    // MARK: - Init
    
    init(dieModel: DieModel) {
        self.dieModel = dieModel
    }
    
    // MARK: - Body
    
    public var body: some View {
        Group {
            if dieModel.visibleSide <= 6 {
                dieImage
            } else {
                dieText
            }
        }
        .onTapGesture {
            withAnimation {
                dieModel.roll()
            }
        }
    }
    
    // MARK: - ViewBuilder
    
    private var dieImage: some View {
        Image(systemName: "die.face.\(dieModel.visibleSide).fill")
            .resizable()
            .frame(maxWidth: maxSideSize,
                   maxHeight: maxSideSize)
            .aspectRatio(1, contentMode: .fit)
            .foregroundStyle(.black, .white)
    }
    
    /// Some replacement Text for die sides greater than 6
    ///
    /// Since there is no native system images for such high numbers
    private var dieText: some View {
        ZStack {
            Image(systemName: "die.face.1.fill")
                .resizable()
                .frame(maxWidth: maxSideSize,
                       maxHeight: maxSideSize)
                .aspectRatio(1, contentMode: .fit)
                .foregroundStyle(.white, .white)

            Text("\(dieModel.visibleSide)")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.black)
        }
    }
    
}

// MARK: - Preview

#Preview {
    ZStack {
        Color.blue
        
        VStack {
            /// Default 4 side die
            var dieModel = DieModel()
            DieView(dieModel: dieModel)
                .border(.pink)
            
            Divider()
            
            /// 8 side die
            var eightSideDieModel = DieModel(totalSides: .eight)
            DieView(dieModel: eightSideDieModel)
                .border(.pink)
        }
    }
}
