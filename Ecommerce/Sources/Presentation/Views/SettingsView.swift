//
//  SettingsView.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 31/12/23.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - Properties
    let container: DependencyContainer

    @EnvironmentObject var sessionManager: SessionManager
    @ObservedObject var viewModel: SettingsViewModel

    init(container: DependencyContainer) {
        self.container = container
        self.viewModel = container.makeSettingsViewModel()
    }

    @State private var notificationsEnabled = true
    @State private var recommendationsEnabled = true

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("ACCOUNT")) {
                    HStack {
                        Image(systemName: "envelope")
                        Text("Email")
                        Spacer()
                        NonSelectableLabel(text: sessionManager.user ?? "--", textColor: .gray)
                    }

                    HStack {
                        Image(systemName: "lock")
                        Text("Password")
                        Spacer()
                        Text("••••••••••")
                            .foregroundColor(.gray)
                    }
                }

                Section(header: Text("CONFIGURATION")) {
                    Toggle(isOn: $notificationsEnabled) {
                        HStack {
                            Image(systemName: "bell")
                            Text("Notifications")
                        }
                    }
                    .tint(.customBlue)

                    Toggle(isOn: $recommendationsEnabled) {
                        HStack {
                            Image(systemName: "hand.thumbsup")
                            Text("Suggestions")
                        }
                    }
                    .tint(.customBlue)
                }

                Section(header: Text("DATA")) {
                    NavigationLink(destination: Text("Customer Service")) {
                        Image(systemName: "person.crop.circle")
                        Text("Atención al cliente")
                    }

                    NavigationLink(destination: Text("Information")) {
                        Image(systemName: "info.circle")
                        Text("Información")
                    }
                }

                Section {
                    Button(action: viewModel.signOut) {
                        Text("Sign Off")
                            .foregroundColor(.red)
                    }
                }
            }
            .navigationBarTitle("Settings")
        }
    }
}
