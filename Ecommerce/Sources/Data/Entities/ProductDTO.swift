//
//  ProductDTO.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 21/1/24.
//

import Foundation

struct ProductDTO: Codable {
    var category: String
    var manufacturer: String
    var name: String
    var description: String
    var size: Int
    var review: Int
    var price: Double
    var favourite: Bool
}
