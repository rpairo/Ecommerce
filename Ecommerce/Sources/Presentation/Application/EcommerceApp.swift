//
//  EcommerceApp.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 28/12/23.
//

import SwiftUI

@main
struct EcommerceApp: App {
    // MARK: - Properties
    let container = DependencyContainer()

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var sessionManager = SessionManager()

    // MARK: - Views
    var body: some Scene {
        WindowGroup {
            if sessionManager.isAuthenticated {
                MainTabView(container: container)
                    .environmentObject(sessionManager)
                    .foregroundColor(.customBlue)
                    .transition(.opacity)
                    .animation(.easeInOut(duration: 0.5), value: sessionManager.isAuthenticated)
                    .tint(.customBlue)
            } else {
                AuthView(container: container)
                    .environmentObject(sessionManager)
                    .foregroundColor(.customBlue)
                    .transition(.opacity)
                    .animation(.easeInOut(duration: 0.5), value: sessionManager.isAuthenticated)
                    .tint(.customBlue)
            }
        }
    }
}
