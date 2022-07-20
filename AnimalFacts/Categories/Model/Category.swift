//
//  Category.swift
//  AnimalFacts
//
//  Created by Dmytro Krupskyi on 18.07.2022.
//

import Foundation

struct Category {
    let order: Int
    let title: String
    let description: String
    let image: String
    let status: Status
    var content: [Fact]
    
    enum CodingKeys: String, CodingKey {
        case order
        case title
        case description
        case image
        case status
        case content
    }
}

// MARK: - Codable

extension Category: Codable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        order = try values.decode(Int.self, forKey: .order)
        title = try values.decode(String.self, forKey: .title)
        description = try values.decode(String.self, forKey: .description)
        image = try values.decode(String.self, forKey: .image)
        status = (try? values.decode(Status.self, forKey: .status)) ?? .unknown
        content = (try? values.decode([Fact].self, forKey: .content)) ?? []
    }
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
