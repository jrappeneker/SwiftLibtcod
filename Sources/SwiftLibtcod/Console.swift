//
//  Console.swift
//  
//
//  Created by Joshua Rappeneker on 2020/06/12.
//

import Darwin
import libtcod

public enum BackgroundBlendMode {
    case none
    case set
    case multiply
    case lighten
    case darken
    case screen
    case colorDodge
    case colorBurn
    case add
    case addA
    case burn
    case overlay
    case alpha
    case `default`
    
    var tcodVal : TCOD_bkgnd_flag_t {
        get {
            switch self {
            case .none:
                return TCOD_BKGND_NONE
            case .set:
                return TCOD_BKGND_SET
            case .multiply:
                return TCOD_BKGND_MULTIPLY
            case .lighten:
                return TCOD_BKGND_LIGHTEN
            case .darken:
                return TCOD_BKGND_DARKEN
            case .screen:
                return TCOD_BKGND_SCREEN
            case .colorDodge:
                return TCOD_BKGND_COLOR_DODGE
            case .colorBurn:
                return TCOD_BKGND_COLOR_BURN
            case .add:
                return TCOD_BKGND_ADD
            case .addA:
                return TCOD_BKGND_ADDA
            case .burn:
                return TCOD_BKGND_BURN
            case .overlay:
                return TCOD_BKGND_OVERLAY
            case .alpha:
                return TCOD_BKGND_ALPH
            case .`default`:
                return TCOD_BKGND_DEFAULT
            }
        }
    }
}
    
    public class Console {
        private var console : UnsafeMutablePointer<TCOD_Console>? = nil
        
        static public func root(width:Int,
                                height:Int,
                                title:String = "Root Window",
                                fullscreen:Bool = false,
                                renderer : TCOD_renderer_t = TCOD_RENDERER_SDL2) -> Console? {
            let result = TCOD_console_init_root(Int32(width), Int32(height), title, fullscreen, renderer)
            if result == TCOD_E_ERROR { return nil }
            return Console()
        }
        
        private init() {
        }
        
        public init(width:Int, height:Int) {
            console = TCOD_console_new(Int32(width), Int32(height))
        }
        
        public func setBackground(color:Color) {
            TCOD_console_set_default_background(console, color.tcodColor)
        }
        
        public func setForeground(color:Color) {
            TCOD_console_set_default_foreground(console, color.tcodColor)
        }
        
        public func putChar(x:Int, y:Int, c:Character, background:BackgroundBlendMode = .none) {
            let c_val : UInt32
            if c.isASCII {
                c_val = UInt32(c.asciiValue!)
            } else {
                c_val = c.unicodeScalars.first!.value
            }
            TCOD_console_put_char(console, Int32(x), Int32(y), Int32(c_val), background.tcodVal)
        }
        
        public func setFont() {
            let path = "dejavu10x10_gs_tc.png"
            TCOD_console_set_custom_font(path, Int32(TCOD_FONT_TYPE_GREYSCALE.rawValue|TCOD_FONT_LAYOUT_TCOD.rawValue), 0, 0)
        }
}
