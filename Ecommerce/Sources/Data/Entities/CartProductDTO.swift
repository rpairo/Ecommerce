//
//  CartProductDTO.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 22/1/24.
//

import Foundation

struct ProductCartDTO: Codable {
    var manufacturer: String
    var name: String
    var description: String
    var size: Int
    var review: Int
    var price: Double
    var favourite: Bool
}
