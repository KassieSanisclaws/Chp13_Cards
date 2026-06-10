//
//  SingleCardView.swift
//  Chp13_Cards
//
//  Created by Kadeem Cherman on 2026-06-01.
//

import SwiftUI
 
struct SingleCardView: View {
    @Environment(\.dismiss) var dismiss
    @State private var currentModal: ToolbarSelection?
    @State private var stickerImage: UIImage?
    @State private var card = Card()
    @Environment(CardStore.self) private var store
    @State private var frameIndex: Int?
    @Environment(\.scenePhase) private var scenePhase
    
    func isSelected(
        _ element: any CardElement
    ) -> Bool {
        store.selectedElement?.id == element.id
    }
    
    var content: some View {
        ZStack {
                ForEach(
                    Array(card.elements.enumerated()),
                    id: \.offset
                ) { _, element in
                    CardElementView(
                        element: element
                    )
                    .border(
                        Settings.borderColor,
                        width: isSelected(element)
                        ? Settings.borderWidth: 0
                    )
                    .resizableView()
                    .onTapGesture{
                        store.selectedElement = element
                    }
                }
            }
        .contentShape(Rectangle())
        .onTapGesture {
            store.selectedElement = nil
        }
        .onDisappear {
            store.selectedElement = nil
        }
     }
    
    var body: some View {
        NavigationStack {
          GeometryReader { proxy in
              CardDetailView(card: $card, viewScale: Settings.calculateScale(proxy.size))
                .frame(width: Settings.calculateSize(proxy.size).width, height: Settings.calculateSize(proxy.size).height)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .sheet(item: $currentModal) {
                    item in
                    switch item {
                    case .stickerModal:
                        
                        StickerModal(
                            stickerImage: $stickerImage
                        )
                        .onDisappear {
                            
                            if let image = stickerImage {
                                
                                card.addElement(
                                    uiImage: image
                                )
                            }
                            
                            stickerImage = nil
                        }
                        
                    case .frameModal:
                        FrameModal(
                            frameIndex: $frameIndex
                        )
                        .onDisappear {
                            if let frameIndex,
                               let selected = store.selectedElement{
                                
                                card.update(
                                    selected,
                                    frameIndex: frameIndex
                                )
                                self.frameIndex = nil
                            }
                        }
                        
                        
                    default:
                        Text(String(describing: item))
                    }
                }
        }
        .onChange(of: scenePhase) {
            _, newPhase in
            
            print("Scene Phase:", newPhase)
            
            if newPhase == .inactive {
                
                print("SAVE TRIGGERED")
                
                card.save()
            }
        }
      }
    }
}
 
#Preview {
    SingleCardView()
        .environment(CardStore())
}
