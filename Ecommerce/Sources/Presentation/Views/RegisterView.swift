//
//  RegisterView.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 4/1/24.
//

import SwiftUI

struct RegisterView: View {
    // MARK: - Properties
    let container: DependencyContainer
    @ObservedObject var viewModel: RegisterViewModel
    @FocusState private var focus: Field?

    // MARK: - Constructors
    init(container: DependencyContainer) {
        self.container = container
        self.viewModel = container.makeRegisterViewModel()
    }

    // MARK: - Views
    var body: some View {
        ZStack {
            BackgroundImageView(imageName: "AuthBackground")
            VStack {
                emailField
                passwordField
                verificationPasswordField
                errorMessage
                registerButton
                    .padding(.top)
            }
            .padding()
            .onAppear {
                focus = .email
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Register").font(.headline).foregroundColor(.white)
                }
            }
        }
    }

    enum Field {
        case email, password, verification
    }

    var emailField: some View {
        TextField("Email", text: $viewModel.email)
            .keyboardType(.emailAddress)
            .autocapitalization(.none)
            .padding()
            .background(.white)
            .border(Color.gray)
            .focused($focus, equals: .email)
            .onSubmit {
                focus = .password
            }
    }

    var passwordField: some View {
        SecureField("Password", text: $viewModel.password)
            .padding()
            .background(.white)
            .border(Color.gray)
            .focused($focus, equals: .password)
            .onSubmit {
                focus = .verification
            }
    }

    var verificationPasswordField: some View {
        SecureField("Password", text: $viewModel.verificationPassword)
            .padding()
            .background(.white)
            .border(Color.gray)
            .focused($focus, equals: .verification)
            .onSubmit {
                if viewModel.password == viewModel.verificationPassword {
                    viewModel.register()
                }
            }
    }

    var errorMessage: some View {
        Group {
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            }
        }
    }

    var registerButton: some View {
        Button("Register", action: viewModel.register)
            .foregroundColor(.black)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(20)
            .disabled(viewModel.email.isEmpty || viewModel.password.isEmpty || viewModel.password != viewModel.verificationPassword)
    }
}
