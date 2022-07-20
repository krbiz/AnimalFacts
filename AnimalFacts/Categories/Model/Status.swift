//
//  Status.swift
//  AnimalFacts
//
//  Created by Dmytro Krupskyi on 20.07.2022.
//

import Foundation

enum Status: String, Codable {
    case free
    case paid
    case unknown = ""
}
