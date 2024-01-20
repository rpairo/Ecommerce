//
//  SettingsViewModel.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 9/1/24.
//

import Foundation

class SettingsViewModel: ObservableObject {
    var coordinator: NavigationCoordinator?
    
    // MARK: - Use case
    private let authUseCase: AuthUseCaseProtocol

    init(coordinator: NavigationCoordinator?, authUseCase: AuthUseCaseProtocol) {
        self.coordinator = coordinator
        self.authUseCase = authUseCase
    }

    func signOut() {
        self.authUseCase.signOut { _ in
            
        }
    }
}
