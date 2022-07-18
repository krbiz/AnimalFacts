//
//  Color+custom.swift
//  AnimalFacts
//
//  Created by Dmytro Krupskyi on 18.07.2022.
//

import SwiftUI

extension Color {
    enum Name: String {
        case purple = "purple"
        case blue = "blue"
    }
    
    static func custom(_ type: Name) -> Color {
        return Color(type.rawValue)
    }
}
