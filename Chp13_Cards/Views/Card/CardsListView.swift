//
//  CardsListView.swift
//  Chp13_Cards
//
//  Created by Kadeem Cherman on 2026-06-01.
//


import SwiftUI

struct CardsListView: View {
    @State private var isPresented = false
    @Environment(CardStore.self) private var store
    @State private var selectedCard: Card?
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var thumbnailSize: CGSize {
        var scale: CGFloat = 1
        if verticalSizeClass == .regular, horizontalSizeClass == .regular {
            scale = 1.5
        }
        return CGSize(
            width: Settings.thumbnailSize.width * scale,
            height: Settings.thumbnailSize.height * scale
        )
    }
    
    var columns: [GridItem] {
        [GridItem(.adaptive(minimum: thumbnailSize.width))]
    }
    
    var createButton: some View {
        Button { selectedCard = store.addCard() }
        label: {
            Label("Create New Card", systemImage: "plus")
                .frame(maxWidth: .infinity)
              }
                .font(.system(size: 17, weight: .bold))
                .padding([.top, .bottom], 10)
                .background(Color.bar).accentColor(Color.accentColor)
              }
    
    var initilView: some View {
        VStack {
                 let card = Card(backgroundColor: Color(uiColor: .systemBackground))
        ZStack {
            CardThumbnail(card: card)
            Image(systemName: "plus.circle.fill")
                .font(.largeTitle)
            }
                .onTapGesture { selectedCard = store.addCard()
            }
        }
                .frame(width: thumbnailSize.width * 1.2, height: thumbnailSize.height * 1.2)
                .padding(.bottom, 20)
    }
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 30) {
                    ForEach(store.cards) { card in
                        CardThumbnail(card: card)
                            .frame(width: thumbnailSize.width, height: thumbnailSize.height)
                            .onTapGesture {
                                selectedCard = card
                            }
                    }
                }
            }
            .padding(.top, 20)
            createButton
        }
        .background(Color.background.ignoresSafeArea())
        .overlay {
            if store.cards.isEmpty {
                ContentUnavailableView { initilView }
                description: { Text("Tap The Plus Button To Add A Card")
                }
            }
        }
        .fullScreenCover(item: $selectedCard) { card in
            SingleCardView()
       }
    }
}

#Preview {
    CardsListView()
        .environment(CardStore())
}
