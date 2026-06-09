//
//  CardStore.swift
//  Chp13_Cards
//
//  Created by Kadeem Cherman on 2026-06-08.
//

import SwiftUI

@Observable
class CardStore {
    var selectedElement: (any CardElement)?
    
    var cards: [Card] = [
        
        Card(),
        Card(),
        Card()
    ]
}
