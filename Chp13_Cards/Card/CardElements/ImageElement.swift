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
    
    var imageFileName: String?
}
    
extension ImageElement: Codable {
    
    enum CodingKeys: CodingKey {
        case transform
        case frameIndex
        case imageFileName
        case textElements
    }
    
 mutating func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(transform, forKey: .transform)
        try container.encode(frameIndex, forKey: .frameIndex)
        if imageFileName == nil {
            imageFileName = UUID().uuidString + ".jpg"
        }
        uiImage?.save(
            filename: imageFileName!
        )
        try container.encode(imageFileName, forKey: .imageFileName)
        let textElements: [TextElement] =
        elements.compactMap {
          $0 as? TextElement
     }
     try container.encode(
        textElements,
        forKey: .textElements
     )
    }
    
    init(

        from decoder: Decoder

    ) throws {
     
        let container =

            try decoder.container(

                keyedBy: CodingKeys.self

            )
     
        transform =

            try container.decode(

                Transform.self,

                forKey: .transform

            )
     
        frameIndex =

            try container.decodeIfPresent(

                Int.self,

                forKey: .frameIndex

            )
     
        imageFileName =

            try container.decodeIfPresent(

                String.self,

                forKey: .imageFileName

            )
     
        uiImage =

            UIImage.load(

                filename:

                    imageFileName ?? ""

            )
        
        elements += try container.decode([TextElement].self, forKey: .textElements))

    }
     
}
