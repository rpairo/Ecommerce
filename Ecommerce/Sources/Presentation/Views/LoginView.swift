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
        ZStack {
            BackgroundImageView(imageName: "AuthBackground")
            VStack {
                emailField
                passwordField
                errorMessage
                signInButton
                    .padding(.top)
            }
            .padding()
            .onAppear {
                focus = .email
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Sign In").font(.headline).foregroundColor(.white)
            }
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
            .background(.white)
    }

    var passwordField: some View {
        SecureField("Password", text: $viewModel.password)
            .padding()
            .border(Color.gray)
            .focused($focus, equals: .password)
            .onSubmit(performSignIn)
            .background(.white)
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
            .foregroundColor(.black)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(20)
            .disabled(viewModel.email.isEmpty || viewModel.password.isEmpty)
    }

    private func performSignIn() {
        viewModel.signIn { username in
            print("Usuario logueado: \(username)")
        }
    }
}
