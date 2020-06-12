//
//  File.swift
//  
//
//  Created by Joshua Rappeneker on 2020/06/12.
//

import Foundation

extension Character {
    public static var doubleHorizontalLine : Character {
        get {
            let s = UnicodeScalar(205)!
            return Character(s)
        }
    }
}
