//
//  Cartable.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 22/1/24.
//

import Foundation

protocol Cartable {
    func addToCart(product: Product, completion: @escaping AddToCartResult)
    func fetchCart(completion: @escaping CartResult)
}
