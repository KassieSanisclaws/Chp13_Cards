//
//  Transform.swift
//  Chp13_Cards
//
//  Created by Kadeem Cherman on 2026-06-08.
//

import SwiftUI

struct Transform {
     
    var size = CGSize(
        width: Settings.defaultElementSize.width,
        height: Settings.defaultElementSize.height
        )
    
    var rotation: Angle = .zero
    var offset: CGSize = .zero
}
