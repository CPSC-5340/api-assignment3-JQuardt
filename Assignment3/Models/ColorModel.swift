//
//  ColorModel.swift
//  Assignment3
//
//  Created by Jenna Marquardt on 3/27/24.
//

import Foundation

struct ColorModel : Codable, Identifiable {
    var id: UUID {
        return UUID()
    }
    var colorModel : Array<Color> = [
        Color("red", "#ff0000"),
        Color("orange", "#ffa500"),
        Color("yellow", "#ffff00"),
        Color("yellow green", "#9acd32"),
        Color("green", "#008000"),
        Color("blue", "#0000ff"),
        Color("violet", "#ee82ee"),
        Color("black", "#000000"),
        Color("gray", "#808080"),
    ]
}

struct Color : Codable, Identifiable {
    var id: UUID {
        return UUID()
    }
    var name : String
    var hex : String
    
    init(_ name: String, _ hex: String) {
        self.name = name
        self.hex = hex
    }
}


