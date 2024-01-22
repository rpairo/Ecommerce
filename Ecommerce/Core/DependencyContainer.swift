//
//  DependencyContainer.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 4/1/24.
//

import Foundation

class DependencyContainer {
    // MARK: - Properties
    let coordinator = NavigationCoordinator()

    // MARK: - ViewModels
    func makeAuthViewModel() -> AuthViewModel {
        AuthViewModel(coordinator: self.coordinator)
    }

    func makeLoginViewModel() -> LoginViewModel {
        LoginViewModel(authUseCase: makeAuthUseCase())
    }

    func makeRegisterViewModel() -> RegisterViewModel {
        RegisterViewModel(authUseCase: makeAuthUseCase())
    }

    func makeDiscoveryViewModel() -> DiscoverViewModel {
        DiscoverViewModel(coordinator: self.coordinator)
    }

    func makeCatalogViewModel() -> CatalogViewModel {
        CatalogViewModel(categoriesUseCase: makeCategoryUseCase())
    }

    func makeCategoryViewModel(category: Category) -> CategoryViewModel {
        CategoryViewModel(category: category, productUseCase: makeProductUseCase())
    }

    func makeCartViewModel() -> CartViewModel {
        CartViewModel(coordinator: self.coordinator)
    }

    func makeFavoritesViewModel() -> FavouritesViewModel {
        FavouritesViewModel(favouriteUseCase: makeFavouriteUseCase())
    }

    func makeSettingsViewModel() -> SettingsViewModel {
        SettingsViewModel(coordinator: self.coordinator, authUseCase: self.makeAuthUseCase())
    }

    func makeProductViewModel(product: Product) -> ProductViewModel {
        ProductViewModel(product: product, toggleFavouriteUseCase: makeToggleFavouriteUseCase(), cartUseCase: makeCartUseCase())
    }

    // MARK: - UseCases
    func makeAuthUseCase() -> AuthUseCaseProtocol {
        AuthUseCase(repository: makeAuthRepository())
    }

    func makeCategoryUseCase() -> CategoryUseCaseProtocol {
        CategoryUseCase(repository: makeCategoryRepository())
    }

    func makeProductUseCase() -> ProductUseCaseProtocol {
        ProductUseCase(repository: makeProductRepository())
    }

    func makeFavouriteUseCase() -> FavouriteUseCaseProtocol {
        FavouriteUseCase(repository: makeProductRepository())
    }

    func makeToggleFavouriteUseCase() -> ToggleFavouriteUseCaseProtocol {
        ToggleFavouriteUseCase(repository: makeToggleFavouriteRepository())
    }

    func makeCartUseCase() -> CartUseCaseProtocol {
        CartUseCase(repository: makeCartRepository())
    }

    // MARK: - Repositories
    func makeAuthRepository() -> Authenticatable {
        FirebaseAuthRepository()
    }

    func makeCategoryRepository() -> Categoriable {
        FirebaseCategoryRepository()
    }

    func makeProductRepository() -> Productable {
        FirebaseProductRepository()
    }

    func makeToggleFavouriteRepository() -> Favouritable {
        FirebaseFavouriteRepository()
    }

    func makeCartRepository() -> Cartable {
        FirebaseCartRepository()
    }
}
