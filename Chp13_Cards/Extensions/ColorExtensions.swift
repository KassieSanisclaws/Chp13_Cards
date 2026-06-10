//
//  ColorExtensions.swift
//  Chp13_Cards
//
//  Created by Kadeem Cherman on 2026-06-08.
//

import SwiftUI


extension Color {
    
    static let colors: [Color] = [
        .green,
        .red,
        .yellow,
        .blue,
        .orange,
        .pink,
        .purple,
        .gray
    ]
    
    static func random() -> Color {
        colors.randomElement() ?? .black
    }
    static let background = Color(.systemTeal)
    static let bar = Color(.systemMint)
    static let shadow = Color.black.opacity(0.15)
}
