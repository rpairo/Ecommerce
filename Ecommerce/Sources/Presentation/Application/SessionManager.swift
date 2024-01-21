//
//  SessionManager.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 30/12/23.
//

import FirebaseAuth

class SessionManager: ObservableObject {
    @Published var isAuthenticated: Bool = false

    var user: String? {
        Auth.auth().currentUser?.email
    }

    init() {
        setupAuthListener()
    }

    private func setupAuthListener() {
        Auth.auth().addStateDidChangeListener { [weak self] (_, user) in
            self?.isAuthenticated = user != nil
        }
    }
}
