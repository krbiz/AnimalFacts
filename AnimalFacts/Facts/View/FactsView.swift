//
//  FactsView.swift
//  AnimalFacts
//
//  Created by Dmytro Krupskyi on 18.07.2022.
//

import SwiftUI

struct FactsView: View {
    @Binding var category: Category
    @State private var selectedTab: Int = 0
    
    var body: some View {
        return TabView(selection: $selectedTab) {
            Group {
                ForEach(category.content.indices, id: \.self) { index in
                    FactCellView(fact: $category.content[index], index: $selectedTab, count: category.content.count)
                        .id(index)
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 50)
            .padding(.bottom, 125)
            .shadow(color: .black.opacity(0.3), radius: 30, y: 20)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .navigationTitle(category.title)
        .navigationBarTitleDisplayMode(.inline)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color.custom(.purple)
                .ignoresSafeArea()
        )
        .animation(.default, value: selectedTab)
    }
}

//struct FactsView_Previews: PreviewProvider {
//    static var previews: some View {
//        FactsView()
//    }
//}
