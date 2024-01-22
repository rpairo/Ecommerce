//
//  Favouritable.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 22/1/24.
//

import Foundation

protocol Favouritable {
    func favourite(for product: Product, to: Bool, completion: @escaping ToggleFavouriteResult)
}
