//
//  RegisterViewModel.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 4/1/24.
//

import Foundation

class RegisterViewModel: ObservableObject {
    // MARK: - Properties
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var verificationPassword: String = ""
    @Published var isAuthenticated: Bool = false
    @Published var errorMessage: String?

    // MARK: - Use case
    private let authUseCase: AuthUseCaseProtocol

    // MARK: - Constructor
    init(authUseCase: AuthUseCaseProtocol) {
        self.authUseCase = authUseCase
    }

    // MARK: - Methods
    func register() {
        authUseCase.register(email: email, password: password) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let user):
                    self?.errorMessage = nil

                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                    self?.isAuthenticated = false
                }
            }
        }
    }
}
