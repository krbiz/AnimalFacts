//
//  AlertNavigator.swift
//  AnimalFacts
//
//  Created by Dmytro Krupskyi on 20.07.2022.
//

import Foundation

enum AlertNavigator: Identifiable {
    case paidAlert
    case comingSoonAlert
    
    var id: Self { return self }
}
