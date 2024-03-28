//
//  ColorExtension.swift
//  Assignment3
//
//  Created by Jenna Marquardt on 3/28/24.
//

import Foundation
import SwiftUI

//extension Color {
//    init(hex: String) {
//        var cleanHexCode = hex.trimmingCharacters(in: .whitespacesAndNewlines)
//        cleanHexCode = cleanHexCode.replacingOccurrences(of: "#", with: "")
//        print(cleanHexCode)
//        var rgb: UInt64 = 0
//        
//        Scanner(string: cleanHexCode).scanHexInt64(&rgb)
//        
//        let redValue = Double((rgb >> 16) & 0xFF) / 255.0
//        let greenValue = Double((rgb >> 8) & 0xFF) / 255.0
//        let blueValue = Double(rgb & 0xFF) / 255.0
//        self.init(red: String(redValue), green: String(greenValue), blue: String(blueValue))
//    }
//}
