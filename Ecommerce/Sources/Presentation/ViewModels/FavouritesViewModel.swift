//
//  FavoritesViewModel.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 9/1/24.
//

import Foundation

class FavouritesViewModel: ObservableObject {
    @Published var favourites: [Product] = []
    @Published var filteredFavourites: [Product] = []
    @Published var isLoading = false
    private let favouriteUseCase: FavouriteUseCaseProtocol

    init(favouriteUseCase: FavouriteUseCaseProtocol) {
        self.favouriteUseCase = favouriteUseCase
    }

    func loadFavourites() {
        isLoading = true
        favouriteUseCase.execute { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let favourites):
                    self?.favourites = favourites
                    self?.filteredFavourites = favourites
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }

    func filterCategories(with query: String) {
        if query.isEmpty {
            filteredFavourites = favourites
        } else {
            filteredFavourites = favourites.filter { $0.name.localizedCaseInsensitiveContains(query) }
        }
    }
}
