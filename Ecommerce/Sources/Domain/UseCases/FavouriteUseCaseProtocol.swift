//
//  FavouriteUseCaseProtocol.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 22/1/24.
//

import Foundation

typealias FavouriteResult = (Result<[Product], Error>) -> Void

protocol FavouriteUseCaseProtocol {
    func execute(completion: @escaping ProductResult)
}
