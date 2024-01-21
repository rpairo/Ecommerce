//
//  ProductUseCase.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 21/1/24.
//

import Foundation

class ProductUseCase: ProductUseCaseProtocol {
    private let repository: Productable

    init(repository: Productable) {
        self.repository = repository
    }

    func execute(for category: String, completion: @escaping ProductResult) {
        repository.fetchProducts(for: category, completion: completion)
    }
}
