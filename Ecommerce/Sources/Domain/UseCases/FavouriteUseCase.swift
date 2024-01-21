//
//  FavouriteUseCase.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 22/1/24.
//

import Foundation

class FavouriteUseCase: FavouriteUseCaseProtocol {
    private let repository: Productable

    init(repository: Productable) {
        self.repository = repository
    }

    func execute(completion: @escaping ProductResult) {
        repository.fetchFavouriteProducts(completion: completion)
    }
}
