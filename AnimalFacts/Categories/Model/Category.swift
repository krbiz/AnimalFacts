//
//  Category.swift
//  AnimalFacts
//
//  Created by Dmytro Krupskyi on 18.07.2022.
//

import Foundation

struct Category: Codable {
    let order: Int
    let title: String
    let description: String
    let image: String
    let status: Status
    let content: [AnimalContent]?
}

struct AnimalContent: Codable {
    let fact: String
    let image: String
}

enum Status: String, Codable {
    case free
    case paid
    case comingSoon = ""
}

// MARK: - Comparable

extension Category: Comparable {
    static func < (lhs: Category, rhs: Category) -> Bool {
        return lhs.order < rhs.order
    }
    
    static func == (lhs: Category, rhs: Category) -> Bool {
        return lhs.order == rhs.order
    }
}
