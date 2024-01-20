//
//  FirebaseAuthRepository.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 4/1/24.
//

import Foundation
import FirebaseAuth

enum AuthError: Error {
    case invalidCredentials
    case invalidEmail
    case invalidPassword
    case unknownError
}

class FirebaseAuthRepository: Authenticatable {

    // MARK: - Iniciar Sesión
    func signIn(email: String, password: String, completion: @escaping AuthResult) {
        guard isValidEmail(email), isValidPassword(password) else {
            completion(.failure(AuthError.invalidCredentials))
            return
        }

        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let user = authResult?.user else {
                completion(.failure(AuthError.unknownError))
                return
            }

            completion(.success(User(email: user.email ?? "")))
        }
    }

    // MARK: - Registro
    func register(email: String, password: String, completion: @escaping AuthResult) {
        guard isValidEmail(email), isValidPassword(password) else {
            completion(.failure(AuthError.invalidCredentials))
            return
        }

        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let user = authResult?.user else {
                completion(.failure(AuthError.unknownError))
                return
            }

            completion(.success(User(email: user.email ?? "")))
        }
    }

    // MARK: - Cerrar Sesión
    func signOut(completion: @escaping (Result<Void, Error>) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(.success(()))
        } catch {
            completion(.failure(error))
        }
    }

    // MARK: - Restablecer Contraseña
    func resetPassword(email: String, completion: @escaping (Result<Void, Error>) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                completion(.failure(error))
                return
            }
            completion(.success(()))
        }
    }

    // MARK: - Validaciones
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

    private func isValidPassword(_ password: String) -> Bool {
        return password.count >= 8 // Ejemplo: mínimo 8 caracteres
    }
}
