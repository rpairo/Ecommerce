//
//  CartUseCase.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 22/1/24.
//

import Foundation

class CartUseCase: CartUseCaseProtocol {
    private let repository: Cartable

    init(repository: Cartable) {
        self.repository = repository
    }

    func execAddToCart(product: Product, completion: @escaping AddToCartResult) {
        repository.addToCart(product: product, completion: completion)
    }

    func execFetchCart(completion: @escaping CartResult) {
        repository.fetchCart(completion: completion)
    }
}
