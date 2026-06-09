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
        var cards: [Card]
        // MARK: - Init
        init(defaultData: Bool = false) {
            cards = defaultData ? Self.initialCards : Self.load()
        }
        // MARK: - Default data (ONLY for first launch / debugging)
        static var initialCards: [Card] {
            [
                Card(),
                Card(),
                Card()
            ]
        }
        // MARK: - Load from disk
        static func load() -> [Card] {
            let url = Card.documentsURL
            guard let files = try? FileManager.default.contentsOfDirectory(at: url,
                                                                            includingPropertiesForKeys: nil)
            else {
                return []
            }
            return files.compactMap { file in
                guard file.pathExtension == "json" else { return nil }
                guard let data = try? Data(contentsOf: file) else { return nil }
                return try? JSONDecoder().decode(Card.self, from: data)
            }
        }
        // MARK: - Add Card (IMPORTANT)
        func addCard() -> Card {
            let card = Card()
            cards.append(card)
            card.save()
            return card
        }
    }
