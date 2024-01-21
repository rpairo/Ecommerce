//
//  Product.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 9/1/24.
//

import Foundation

struct Product: Identifiable {
    var id: String
    let manufacturer: String
    let description: String
    let favourite: Bool
    let name: String
    let price: Decimal
    let review: Int
    let size: Int
}
