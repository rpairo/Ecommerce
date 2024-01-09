//
//  FirebaseAuthRepository.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 4/1/24.
//

import Foundation
import FirebaseAuth

class FirebaseAuthRepository: Authenticatable {

    func signIn(email: String, password: String, completion: @escaping AuthResult) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            let user = User(email: authResult?.user.email ?? "")
            completion(.success(user))
        }
    }

    func register(email: String, password: String, completion: @escaping AuthResult) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            let user = User(email: authResult?.user.email ?? "")
            completion(.success(user))
        }
    }

}
