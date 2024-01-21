//
//  ProductView.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 21/1/24.
//

import SwiftUI

struct ProductView: View {
    let product: Product

    init(product: Product) {
        self.product = product
    }

    var body: some View {
        Text(product.name)
    }
}
