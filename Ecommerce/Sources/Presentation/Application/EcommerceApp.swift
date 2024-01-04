//
//  EcommerceApp.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 28/12/23.
//

import SwiftUI

@main
struct EcommerceApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var sessionManager = SessionManager()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                if sessionManager.isAuthenticated {
                    MainTabView()
                        .environmentObject(sessionManager)
                } else {
                    AuthView(
                        viewModel: AuthViewModel(
                            authUseCase: AuthUseCase()
                        )
                    ).environmentObject(sessionManager)
                }
            }
        }
    }
}
