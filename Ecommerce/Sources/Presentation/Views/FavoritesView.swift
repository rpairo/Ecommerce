//
//  FavoritesView.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 31/12/23.
//

import SwiftUI

struct FavoritesView: View {
    @State private var searchText = ""
    @ObservedObject var viewModel: FavouritesViewModel
    let container: DependencyContainer

    // MARK: - Constructors
    init(container: DependencyContainer) {
        self.container = container
        self.viewModel = container.makeFavoritesViewModel()
    }

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(searchText: $searchText)
                List(viewModel.filteredFavourites) { favourite in
                    NavigationLink(destination: ProductView(product: favourite, container: container)) {
                        ProductRow(product: favourite)
                    }
                }
                .listStyle(PlainListStyle())
                .background(Color.white)
                .scrollIndicators(.never)
            }

            .navigationTitle("Favourites")
        }
        .onAppear {
            viewModel.loadFavourites()
        }
        .onChange(of: searchText) {
            viewModel.filterCategories(with: searchText)
        }
    }
}
