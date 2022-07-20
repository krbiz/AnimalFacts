//
//  CategoriesView.swift
//  AnimalFacts
//
//  Created by Dmytro Krupskyi on 18.07.2022.
//

import SwiftUI

struct CategoriesView: View {
    @StateObject private var viewModel = CategoriesViewModel()
    @State private var showFacts: Bool = false
    @State private var selectedCategory: Category?
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(viewModel.categories, id: \.order) { category in
                        Button {
                            selectedCategory = category
                            showFacts = true
                        } label: {
                            CategoryCellView(category: category)
                        }
                        .buttonStyle(SelectableButtonStyle())
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 30)
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
            .overlay(
                Color.custom(.purple)
                    .frame(height: Device.safeAreaInset.top)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    .ignoresSafeArea()
            )
            .background(
                Color.custom(.purple)
                    .ignoresSafeArea()
            )
            .overlay(
                NavigationLink(isActive: $showFacts, destination: {
                    if let category = selectedCategory {
                        FactsView(category: category)
                    }
                }, label: {
                    EmptyView()
                })
            )
        }
        .onLoad {
            viewModel.fetchData()
        }
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
