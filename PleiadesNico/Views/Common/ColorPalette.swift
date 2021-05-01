//
//  ColorPalette.swift
//  XML_Sample
//
//  Created by katot on 2021/04/03.
//

import Foundation

class ColorPalette {

    private static let _pastel = [
        RGBColor(0x32B6DC),
        RGBColor(0x007AC0),
        RGBColor(0x003A75),
        RGBColor(0xC14747),
        RGBColor(0xF17E64)
    ]
    
    static func pastel(_ num : Int) -> RGBColor {
        return _pastel[ num % _pastel.count ]
    }

    struct RGBColor {
        let r : Double
        let g : Double
        let b : Double
        
        init(_ rgb:Int){
            r = Double((rgb >> 16) & 0xFF) / 256.0
            g = Double((rgb >> 8 ) & 0xFF) / 256.0
            b = Double((rgb      ) & 0xFF) / 256.0
        }
    }

}
