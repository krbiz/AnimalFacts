//
//  SelectableButtonStyle.swift
//  AnimalFacts
//
//  Created by Dmytro Krupskyi on 18.07.2022.
//

import SwiftUI

struct SelectableButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        ZStack(alignment: .leading) {
            configuration.label
                .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
                .brightness(configuration.isPressed ? -0.1 : 0)
                .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
        }
    }
}
