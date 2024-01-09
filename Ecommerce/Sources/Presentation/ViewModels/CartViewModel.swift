//
//  CartViewModel.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 9/1/24.
//

import Foundation

class CartViewModel: ObservableObject {
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
