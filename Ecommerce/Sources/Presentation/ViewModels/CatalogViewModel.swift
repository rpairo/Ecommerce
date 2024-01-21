//
//  CatalogViewModel.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 9/1/24.
//

import Foundation

class CatalogViewModel: ObservableObject {
    @Published var categories: [Category] = []
    @Published var filteredCategories: [Category] = []
    @Published var isLoading = false
    private let fetchCategoriesUseCase: CategoryUseCaseProtocol

    init(fetchCategoriesUseCase: CategoryUseCaseProtocol) {
        self.fetchCategoriesUseCase = fetchCategoriesUseCase
    }

    func loadCategories() {
        isLoading = true
        fetchCategoriesUseCase.execute { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let categories):
                    self?.categories = categories
                    self?.filteredCategories = categories
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }

    func filterCategories(with query: String) {
        if query.isEmpty {
            filteredCategories = categories
        } else {
            filteredCategories = categories.filter { $0.name.localizedCaseInsensitiveContains(query) }
        }
    }
}
