//
//  ProductUseCaseProtocol.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 21/1/24.
//

import Foundation

typealias ProductResult = (Result<[Product], Error>) -> Void

protocol ProductUseCaseProtocol {
    func execute(for category: String, completion: @escaping ProductResult)
}
