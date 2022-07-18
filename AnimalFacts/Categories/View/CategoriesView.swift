//
//  CategoriesView.swift
//  AnimalFacts
//
//  Created by Dmytro Krupskyi on 18.07.2022.
//

import SwiftUI

struct CategoriesView: View {
    @StateObject var viewModel = CategoriesViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(viewModel.categories, id: \.order) { category in
                        Button {
                            
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
            .background(
                Color.purple
                    .ignoresSafeArea()
            )
            .overlay(
                Color.purple
                    .frame(height: Device.safeAreaInset.top)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    .ignoresSafeArea()
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
