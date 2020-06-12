//
//  Sys.swift
//  
//
//  Created by Joshua Rappeneker on 2020/06/12.
//

import Foundation
import libtcod

public struct Sys {
    public struct EventType : OptionSet {
        public let rawValue: Int32
        
        public init(rawValue:Int32) {
            self.rawValue = rawValue
        }
        
        public static let none = EventType([])
        public static let keyPress = EventType(rawValue: 1)
        public static let keyRelease = EventType(rawValue: 2)
        public static let key : EventType = [.keyPress, .keyRelease]
        
        public static let mouseMove = EventType(rawValue: 4)
        public static let mousePress = EventType(rawValue: 8)
        public static let mouseRelease = EventType(rawValue: 16)
        public static let mouse : EventType = [.mouseMove, .mousePress, .mouseRelease]
    }
    
    public static func checkForEvent(eventType:EventType = EventType.none, key keyCallBack:((TCOD_key_t)->())?=nil, mouse mouseCallback:((TCOD_mouse_t)->())?=nil) {
        var key : TCOD_key_t = TCOD_key_t()
        var mouse : TCOD_mouse_t = TCOD_mouse_t()
        TCOD_sys_check_for_event(eventType.rawValue, &key, &mouse)
        
        keyCallBack?(key)
        mouseCallback?(mouse)
    }
}
