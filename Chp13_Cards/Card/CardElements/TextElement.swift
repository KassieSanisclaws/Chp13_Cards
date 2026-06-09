//
//  TextElement.swift
//  Chp13_Cards
//
//  Created by Kadeem Cherman on 2026-06-08.
//

import SwiftUI

struct TextElement: CardElement, Codable {
 
    var id = UUID()
 
    var transform = Transform()
 
    var text: String
}
