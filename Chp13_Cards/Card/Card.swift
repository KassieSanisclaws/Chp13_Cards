//
//  Card.swift
//  Chp13_Cards
//
//  Created by Kadeem Cherman on 2026-06-08.
//

import SwiftUI

struct Card: Identifiable {
    
    let id = UUID()
    var elements: [any CardElement] = []
}
    
    extension Card {
        
        mutating func update(
        _ element: any CardElement,
            frameIndex: Int
        ) {
            guard let index = elements.firstIndex(
                where: {
                    $0.id == element.id
                })
                    
            else {
                  return
                
            }
            
            guard var image = elements[index] as? ImageElement
                    
            else {
                return
            }
            
            image.frameIndex = frameIndex
            
            elements[index] = image
            
        }
        
        mutating func addElement(
            uiImage: UIImage
        ) {
            
            let imageElement =
            ImageElement(
                uiImage: uiImage
            )
            
            elements.append(imageElement)
        }
        
        mutating func addElement(
            text: String
        ) {
            let text = TextElement(text: text)
            elements.append(text)
        }
    }
