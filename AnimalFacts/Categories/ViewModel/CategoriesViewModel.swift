//
//  CategoriesViewModel.swift
//  AnimalFacts
//
//  Created by Dmytro Krupskyi on 18.07.2022.
//

import SwiftUI

class CategoriesViewModel: ObservableObject {
    
    @Published var categories: [Category] = []
    @Published var isFetching: Bool = false
    
    func fetchData() {
        defer {
            isFetching = false
        }
        
        isFetching = true
        
        guard let url = Bundle.main.url(forResource: "ios-challenge-words-booster", withExtension: "json") else {
            print("Data file not found")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let categories = try JSONDecoder().decode([Category].self, from: data)
            self.categories = categories.sorted()
        } catch {
            print(error)
        }
    }
    
}
