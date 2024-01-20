//
//  Authenticatable.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 4/1/24.
//

import Foundation

protocol Authenticatable {
    func signIn(email: String, password: String, completion: @escaping AuthResult)
    func register(email: String, password: String, completion: @escaping AuthResult)
    func signOut(completion: @escaping SignOutResult)
}
