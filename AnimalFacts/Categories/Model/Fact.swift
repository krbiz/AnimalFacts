//
//  Fact.swift
//  AnimalFacts
//
//  Created by Dmytro Krupskyi on 20.07.2022.
//

import Foundation

struct Fact: Equatable {
    let fact: String
    let image: String
    
    var isFavourite: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case fact
        case image
    }
}

// MARK: - Codable

extension Fact: Codable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        fact = try values.decode(String.self, forKey: .fact)
        image = try values.decode(String.self, forKey: .image)
    }
}
