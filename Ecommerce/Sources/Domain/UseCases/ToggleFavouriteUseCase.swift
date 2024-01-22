//
//  ToggleFavouriteUseCase.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 22/1/24.
//

import Foundation

class ToggleFavouriteUseCase: ToggleFavouriteUseCaseProtocol {
    private let repository: Favouritable

    init(repository: Favouritable) {
        self.repository = repository
    }

    func execute(for product: Product, to: Bool, completion: @escaping ToggleFavouriteResult) {
        repository.favourite(for: product, to: to, completion: completion)
    }
}
