//
//  DiceModel.swift
//  DiceRoller
//
//  Created by Felipe Eduardo Campelo Ferreira Osorio on 30/01/26.
//

import Foundation

struct DieModel: Identifiable {
    
    // MARK: - Properties
    
    internal let id = UUID()
    
    /// The current side turned up
    public var visibleSide: Int
    
    /// Constraints the maximun number of sides of a die
    ///
    /// The list of possibilities goes from 4 up to 20 sides in a single die
    internal enum MaximumSides: Int {
        /// 4 Maximum sides
        case four = 4
        /// 8 Maximum sides
        case eight = 8
        /// 12 Maximum sides
        case twelve = 12
        /// 20 Maximum sides
        case twenty = 20
    }
    
    private var totalSides: MaximumSides
    
    // MARK: - Init
    
    /// `DieModel` init
    ///
    /// Defaults to:
    /// - Parameter `totalSides` = 4
    /// - Parameter `visibleSide` = totalSides.rawValue
    public init(totalSides: MaximumSides = .four) {
        self.totalSides = totalSides
        self.visibleSide = totalSides.rawValue
    }
    
    // MARK: - Public methods
    
    /// Randomize a new value for `visibleSide`
    ///
    /// The value is constrained between 1 and the `totalSides`
    public mutating func roll() {
        visibleSide = Int.random(in: 1...totalSides.rawValue)
    }
}

import Playgrounds

#Playground {
    var fourSideDie = DieModel(totalSides: .four)
    fourSideDie.roll()
    
    var eightSideDie = DieModel(totalSides: .eight)
    eightSideDie.roll()
}
