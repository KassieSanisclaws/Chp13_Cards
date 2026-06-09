//
//  CardElement.swift
//  Chp13_Cards
//
//  Created by Kadeem Cherman on 2026-06-08.
//

import SwiftUI

protocol CardElement: Identifiable {
    
    var id: UUID { get }
    var transform: Transform { get set }
}
