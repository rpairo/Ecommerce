//
//  AuthUseCase.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 29/12/23.
//

import Foundation

class AuthUseCase: AuthUseCaseProtocol {
    private let repository: Authenticatable

    init(repository: Authenticatable) {
        self.repository = repository
    }

    func signIn(email: String, password: String, completion: @escaping AuthResult) {
        repository.signIn(email: email, password: password, completion: completion)
    }

    func register(email: String, password: String, completion: @escaping AuthResult) {
        repository.register(email: email, password: password, completion: completion)
    }

    func signOut(completion: @escaping SignOutResult) {
        repository.signOut(completion: completion)
    }
}
