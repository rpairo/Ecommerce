//
//  Productable.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 21/1/24.
//

import Foundation

protocol Productable {
    func fetchProducts(for category: String, completion: @escaping ProductResult)
    func fetchFavouriteProducts(completion: @escaping ProductResult)
}
