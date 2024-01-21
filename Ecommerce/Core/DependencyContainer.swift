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
        CatalogViewModel(fetchCategoriesUseCase: makeCategoryUseCase())
    }

    func makeCartViewModel() -> CartViewModel {
        CartViewModel(coordinator: self.coordinator)
    }

    func makeFavoritesViewModel() -> FavoritesViewModel {
        FavoritesViewModel(coordinator: self.coordinator)
    }

    func makeSettingsViewModel() -> SettingsViewModel {
        SettingsViewModel(coordinator: self.coordinator, authUseCase: self.makeAuthUseCase())
    }

    // MARK: - UseCases
    func makeAuthUseCase() -> AuthUseCaseProtocol {
        AuthUseCase(repository: makeAuthRepository())
    }

    func makeCategoryUseCase() -> CategoryUseCaseProtocol {
        CategoryUseCase(repository: makeCategoryRepository())
    }

    // MARK: - Repositories
    func makeAuthRepository() -> Authenticatable {
        FirebaseAuthRepository()
    }

    func makeCategoryRepository() -> Categoriable {
        FirebaseCategoryRepository()
    }
}
