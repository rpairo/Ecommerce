//
//  LoginView.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 4/1/24.
//

import SwiftUI

struct LoginView: View {
    // MARK: - Properties
    let container: DependencyContainer

    @ObservedObject var viewModel: LoginViewModel

    // MARK: - Constructors
    init(container: DependencyContainer) {
        self.container = container
        self.viewModel = container.makeLoginViewModel()
    }

    // MARK: - Views
    var body: some View {
        VStack {
            TextField("Email", text: $viewModel.email)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .padding()
                .border(Color.gray)

            SecureField("Password", text: $viewModel.password)
                .padding()
                .border(Color.gray)

            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            }

            Button("Sign In") {
                viewModel.signIn { username in
                    print("Usuario logueado: \(username)")
                }
            }
            .disabled(viewModel.email.isEmpty || viewModel.password.isEmpty)
        }
        .padding()
    }
}
