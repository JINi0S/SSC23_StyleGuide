//
//  Color.swift
//  CreateStyleGuide
//
//  Created by Lee Jinhee on 2023/04/08.
//

import Foundation
import SwiftUI

extension Color {
    static let mainBlue = Color(hex: "ADBCE1")
    static let darkBlue = Color(hex: "8998C1")
    static let lightBlue = Color(hex: "F0F4FF")
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >>  8) & 0xFF) / 255.0
        let b = Double((rgb >>  0) & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
      }
}
