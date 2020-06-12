//
//  Color.swift
//  
//
//  Created by Joshua Rappeneker on 2020/06/12.
//

import Foundation
import libtcod

public struct Color {
    var red : Double
    var blue : Double
    var green : Double
    var alpha : Double
    
    public init(red:Double, blue:Double, green:Double, alpha:Double=1) {
        self.red = red
        self.blue = blue
        self.green = green
        self.alpha = alpha
    }
    
    var tcodColor:TCOD_color_t {
        get {
            let r = min(UInt8(255*red),255)
            let g = min(UInt8(255*green),255)
            let b = min(UInt8(255*blue),255)
            return TCOD_color_RGB(r, g, b)
        }
    }
}

extension Color {
    public static var black : Color {
        return Color(red: 0, blue: 0, green: 0)
    }
    public static var white : Color {
        return Color(red: 1, blue: 1, green: 1)
    }
    public static var red : Color {
        return Color(red: 1, blue: 0, green: 0)
    }
}
