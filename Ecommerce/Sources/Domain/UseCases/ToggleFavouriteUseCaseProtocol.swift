//
//  ToggleFavouriteUseCaseProtocol.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 22/1/24.
//

import Foundation

typealias ToggleFavouriteResult = (Result<Bool, Error>) -> Void

protocol ToggleFavouriteUseCaseProtocol {
    func execute(for product: Product, to: Bool, completion: @escaping ToggleFavouriteResult)
}
