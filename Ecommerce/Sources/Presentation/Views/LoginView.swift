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
    @FocusState private var focus: Field?

    // MARK: - Constructors
    init(container: DependencyContainer) {
        self.container = container
        self.viewModel = container.makeLoginViewModel()
    }

    // MARK: - Views
    var body: some View {
        VStack {
            emailField
            passwordField
            errorMessage
            signInButton
        }
        .padding()
        .onAppear {
            focus = .email
        }

        .navigationTitle("Sign In")
    }

    enum Field {
        case email, password
    }

    var emailField: some View {
        TextField("Email", text: $viewModel.email)
            .keyboardType(.emailAddress)
            .autocapitalization(.none)
            .padding()
            .border(Color.gray)
            .focused($focus, equals: .email)
            .onSubmit {
                focus = .password
            }
    }

    var passwordField: some View {
        SecureField("Password", text: $viewModel.password)
            .padding()
            .border(Color.gray)
            .focused($focus, equals: .password)
            .onSubmit(performSignIn)
    }

    var errorMessage: some View {
        Group {
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            }
        }
    }

    var signInButton: some View {
        Button("Sign In", action: performSignIn)
            .disabled(viewModel.email.isEmpty || viewModel.password.isEmpty)
    }

    private func performSignIn() {
        viewModel.signIn { username in
            print("Usuario logueado: \(username)")
        }
    }
}
