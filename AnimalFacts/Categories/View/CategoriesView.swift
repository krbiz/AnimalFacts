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
    @State private var selectedIndex: Int?
    @State private var showAlert: AlertNavigator?
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 16) {
                    if !viewModel.favourites.isEmpty {
                        Button {
                            clickedFavourites()
                        } label: {
                            FavouriteCellView(factsCount: viewModel.favourites.count)
                        }
                        .buttonStyle(SelectableButtonStyle())
                    }
                    
                    ForEach(viewModel.categories, id: \.order) { category in
                        Button {
                            clickedCategory(category)
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
                    if let index = selectedIndex {
                        if index == -1 {
                            let favouritesCategory = Category(
                                order: 0,
                                title: "Favourites ⭐️",
                                description: "",
                                image: "",
                                status: .free,
                                content: viewModel.favourites
                            )
                            FactsView(category: .constant(favouritesCategory))
                        } else {
                            FactsView(category: $viewModel.categories[index])
                        }
                    }
                }, label: {
                    EmptyView()
                })
            )
            .overlay(
                Group {
                    if viewModel.isFetching {
                        ZStack {
                            Color.black.opacity(0.5)
                            
                            Color.black.opacity(0.5)
                                .frame(width: 75, height: 75)
                                .cornerRadius(10)
                            
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                        .ignoresSafeArea()
                    }
                }
            )
            .alert(item: $showAlert, content: { alert in
                switch alert {
                case .paidAlert:
                    return PaidAlert()
                case .comingSoonAlert:
                    return ComingSoonAlert()
                }
            })
        }
        .onLoad {
            viewModel.fetchData()
        }
    }
    
    // MARK: - Alerts
    
    private func PaidAlert() -> Alert {
        Alert(
            title: Text("Watch Ad to continue"),
            primaryButton: .default(Text("Show Ad"), action: {
                clickedShowAdd()
            }),
            secondaryButton: .cancel(Text("Cancel"))
        )
    }
    
    private func ComingSoonAlert() -> Alert {
        Alert(title: Text("Coming soon"))
    }
    
    // MARK: - User actions
    
    private func clickedCategory(_ category: Category) {
        selectedIndex = viewModel.categories.firstIndex(of: category)
        switch category.status {
        case .free:
            showFacts = true
        case .paid:
            showAlert = .paidAlert
        case .unknown:
            showAlert = .comingSoonAlert
        }
    }
    
    private func clickedFavourites() {
        selectedIndex = -1
        showFacts = true
    }
    
    private func clickedShowAdd() {
        viewModel.isFetching = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            viewModel.isFetching = false
            showFacts = true
        }
    }
    
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
