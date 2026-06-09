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
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(transform, forKey: .transform)
        try container.encode(frameIndex, forKey: .frameIndex)
        let fileName = imageFileName ??
        UUID().uuidString + ".jpg"
        uiImage?.save(filename: fileName)
        try container.encode(fileName, forKey: .imageFileName)
     }
    
    init(from decoder: Decoder) throws {
     
        let container = try decoder.container(keyedBy: CodingKeys.self)
     
        transform = try container.decode(Transform.self,forKey: .transform)
     
        frameIndex = try container.decodeIfPresent(Int.self,forKey: .frameIndex)
     
        imageFileName = try container.decodeIfPresent(String.self,forKey: .imageFileName)
     
        uiImage = UIImage.load(filename: imageFileName ?? "")
    }
}
