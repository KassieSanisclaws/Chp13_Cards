//
//  ImageElement.swift
//  Chp13_Cards
//
//  Created by Kadeem Cherman on 2026-06-08.
//

import SwiftUI
 
struct ImageElement: CardElement {
    
    let id = UUID()
    
    var frameIndex: Int?
 
    var transform = Transform()
 
    var uiImage: UIImage?
 
    var image: Image {
 
        Image(
            uiImage: uiImage ?? UIImage.error
        )
    }
}
