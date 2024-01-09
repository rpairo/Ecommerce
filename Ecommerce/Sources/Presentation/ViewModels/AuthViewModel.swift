//
//  AuthViewModel.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 29/12/23.
//

import Foundation

class AuthViewModel: ObservableObject {
    var coordinator: NavigationCoordinator?

    init(coordinator: NavigationCoordinator?) {
        self.coordinator = coordinator
    }

    func showLogin() {
        coordinator?.navigate(to: .login)
    }

    func showRegister() {
        coordinator?.navigate(to: .register)
    }
}
