//
//  CategoryUseCase.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 21/1/24.
//

import Foundation

class CategoryUseCase: CategoryUseCaseProtocol {
    private let repository: Categoriable

    init(repository: Categoriable) {
        self.repository = repository
    }

    func execute(completion: @escaping CategoryResult) {
        repository.fetchCategories(completion: completion)
    }
}
