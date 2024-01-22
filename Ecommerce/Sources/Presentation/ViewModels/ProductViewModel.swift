//
//  ProductViewModel.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 22/1/24.
//

import Foundation

class ProductViewModel: ObservableObject {

    var product: Product
    @Published var isFavourite: Bool
    private let toggleFavouriteUseCase: ToggleFavouriteUseCaseProtocol
    private let cartUseCase: CartUseCaseProtocol

    init(product: Product, toggleFavouriteUseCase: ToggleFavouriteUseCaseProtocol, cartUseCase: CartUseCaseProtocol) {
        self.product = product
        self.isFavourite = product.favourite
        self.toggleFavouriteUseCase = toggleFavouriteUseCase
        self.cartUseCase = cartUseCase
    }

    func addToBasket() {
        cartUseCase.execAddToCart(product: product) { result in
            switch result {
            case .success(let insert):
                print(insert)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    func markAsFavourite() {
        toggleFavouriteUseCase.execute(for: product, to: !product.favourite) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let favourite):
                    self.product.favourite = favourite
                    self.isFavourite = favourite
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
