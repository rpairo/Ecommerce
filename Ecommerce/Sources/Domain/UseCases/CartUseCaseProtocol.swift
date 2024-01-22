//
//  CartUseCaseProtocol.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 22/1/24.
//

import Foundation

typealias AddToCartResult = (Result<Bool, Error>) -> Void
typealias CartResult = (Result<[Product], Error>) -> Void

protocol CartUseCaseProtocol {
    func execAddToCart(product: Product, completion: @escaping AddToCartResult)
    func execFetchCart(completion: @escaping CartResult)
}
