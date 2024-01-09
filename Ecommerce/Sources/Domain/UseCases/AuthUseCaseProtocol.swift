//
//  AuthUseCaseProtocol.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 29/12/23.
//

import Foundation

// MARK: Result
typealias AuthResult = (Result<User, Error>) -> Void

protocol AuthUseCaseProtocol {
    func signIn(email: String, password: String, completion: @escaping AuthResult)
    func register(email: String, password: String, completion: @escaping AuthResult)
}
