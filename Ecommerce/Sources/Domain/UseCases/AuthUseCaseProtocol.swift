//
//  AuthUseCaseProtocol.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 29/12/23.
//

import Foundation

// MARK: Result
typealias AuthResult = (Result<User, Error>) -> Void
typealias SignOutResult = (Result<Void, Error>) -> Void

protocol AuthUseCaseProtocol {
    func signIn(email: String, password: String, completion: @escaping AuthResult)
    func register(email: String, password: String, completion: @escaping AuthResult)
    func signOut(completion: @escaping SignOutResult)
}
