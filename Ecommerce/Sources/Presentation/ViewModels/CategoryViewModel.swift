//
//  CategoryViewModel.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 21/1/24.
//

import Foundation

class CategoryViewModel: ObservableObject {
    // Propiedades publicadas que la vista observará
    @Published var products: [Product] = []
    @Published var searchText = ""

    // Propiedades internas
    private let category: Category
    private let fetchProductUseCase: ProductUseCaseProtocol

    // Inicializador que toma una categoría y un repositorio de productos
    init(category: Category, productUseCase: ProductUseCaseProtocol) {
        self.category = category
        self.fetchProductUseCase = productUseCase
    }

    // Función para cargar productos de esta categoría
    func loadProducts() {
        fetchProductUseCase.execute(for: category.id) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let products):
                    self?.products = products
                    print("Products ViewModel: \(products.count)")
                case .failure(let error):
                    // Manejar el error, por ejemplo, mostrando un mensaje al usuario
                    print(error.localizedDescription)
                }
            }
        }
    }

    // Función para filtrar productos basada en la búsqueda
    var filteredProducts: [Product] {
        if searchText.isEmpty {
            return products
        } else {
            return products.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
}
