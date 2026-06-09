//
//  Operators.swift
//  Chp13_Cards
//
//  Created by Kadeem Cherman on 2026-06-08.
//

import SwiftUI

func + (
    left: CGSize,
    right: CGSize
) -> CGSize {
    
    CGSize(width: left.width + right.width,
           height: left.height + right.height
    )
}
