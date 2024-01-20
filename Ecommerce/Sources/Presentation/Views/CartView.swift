//
//  CartView.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 31/12/23.
//

import SwiftUI

struct CartView: View {
    // MARK: - Properties
    let container: DependencyContainer

    @ObservedObject var viewModel: CartViewModel

    init(container: DependencyContainer) {
        self.container = container
        self.viewModel = container.makeCartViewModel()
    }

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
