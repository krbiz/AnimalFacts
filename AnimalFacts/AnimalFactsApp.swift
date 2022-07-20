//
//  AnimalFactsApp.swift
//  AnimalFacts
//
//  Created by Dmytro Krupskyi on 18.07.2022.
//

import SwiftUI

@main
struct AnimalFactsApp: App {
    init() {
        setGlobalAppearance()
    }
    
    var body: some Scene {
        WindowGroup {
            CategoriesView()
        }
    }
    
    private func setGlobalAppearance() {
        let image = UIImage(named: "navbar-back")?
            .withAlignmentRectInsets(UIEdgeInsets(top: 0, left: -7, bottom: 0, right: 7))
            .withRenderingMode(.alwaysOriginal)
        
        UINavigationBar.appearance().backIndicatorImage = image
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = image
        UINavigationBar.appearance().barTintColor = .clear
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
    }
}
