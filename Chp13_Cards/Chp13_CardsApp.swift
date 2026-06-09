//
//  Chp13_CardsApp.swift
//  Chp13_Cards
//
//  Created by Kadeem Cherman on 2026-06-01.
//

import SwiftUI

@main
struct Chp13_CardsApp: App {
    var body: some Scene {
        WindowGroup {
           CardsListView()
           .environment(CardStore())
        }
    }
}
