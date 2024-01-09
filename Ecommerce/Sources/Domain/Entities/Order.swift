//
//  Order.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 9/1/24.
//

import Foundation

struct Order {
    let id: UUID
    let products: [Product]
    let payment: Payment
    let user: User
}
