//
//  AuthView.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 29/12/23.
//

import SwiftUI

struct AuthView: View {
    @ObservedObject var viewModel: AuthViewModel

    var body: some View {
        ZStack {
            BackgroundImageView(imageName: "AuthBackground")
            ContentOverlayView(viewModel: viewModel)
        }
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
            SignInButton(action: viewModel.signIn)
            RegisterButton(action: viewModel.register)
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
