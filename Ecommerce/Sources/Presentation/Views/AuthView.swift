//
//  AuthView.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 29/12/23.
//

import SwiftUI

struct AuthView: View {
    // MARK: - Properties
    let container: DependencyContainer

    @ObservedObject var coordinator: NavigationCoordinator
    @ObservedObject var viewModel: AuthViewModel

    // MARK: - Constructors
    init(container: DependencyContainer) {
        self.container = container
        self.viewModel = container.makeAuthViewModel()
        self.coordinator = container.coordinator
    }

    // MARK: - Views
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            ZStack {
                BackgroundImageView(imageName: "AuthBackground")
                ContentOverlayView(viewModel: viewModel)
            }
            .navigationDestination(for: NavigationDestination.self) { destination in
                switch destination {
                case .login:
                    LoginView(container: container)
                case .register:
                    RegisterView(container: container)
                }
            }
        }
        .environmentObject(coordinator)
    }
}

struct BackgroundImageView: View {
    let imageName: String

    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentOverlayView: View {
    @ObservedObject var viewModel: AuthViewModel

    var body: some View {
        VStack {
            LogoImageView()
            AppTitleView(title: "Gourmet")
            Spacer()
            AuthButtonsView(viewModel: viewModel)
        }
    }
}

struct LogoImageView: View {
    var body: some View {
        Image(.appLogo)
            .resizable()
            .scaledToFit()
            .frame(width: 150, height: 150)
            .padding(.top, 100)
    }
}

struct AppTitleView: View {
    let title: String

    var body: some View {
        Text(title)
            .font(.largeTitle)
            .foregroundColor(.white)
    }
}

struct AuthButtonsView: View {
    var viewModel: AuthViewModel

    var body: some View {
        VStack(spacing: 16) {
            SignInButton {
                viewModel.showLogin()
            }

            RegisterButton {
                viewModel.showRegister()
            }
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 50)
    }
}

struct SignInButton: View {
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text("Sign In")
                .foregroundColor(.black)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(20)
        }
    }
}

struct RegisterButton: View {
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text("Register")
                .foregroundColor(.black)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(20)
        }
    }
}
