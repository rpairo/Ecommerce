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

    @EnvironmentObject var sessionManager: SessionManager
    @ObservedObject var viewModel: RegisterViewModel

    // MARK: - Constructors
    init(container: DependencyContainer) {
        self.container = container
        self.viewModel = container.makeRegisterViewModel()
    }

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
