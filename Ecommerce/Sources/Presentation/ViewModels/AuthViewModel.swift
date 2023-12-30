//
//  AuthViewModel.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 29/12/23.
//

import Foundation

class AuthViewModel: ObservableObject {
    private let authUseCase: AuthUseCaseProtocol

    init(authUseCase: AuthUseCaseProtocol) {
        self.authUseCase = authUseCase
    }

    func signIn() {
        authUseCase.signIn { _ in }
    }

    func register() {
        authUseCase.register { _ in }
    }
}
