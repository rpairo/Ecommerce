//
//  CategoryUseCaseProtocol.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 21/1/24.
//

import Foundation

// MARK: Result
typealias CategoryResult = (Result<[Category], Error>) -> Void

protocol CategoryUseCaseProtocol {
    func execute(completion: @escaping CategoryResult)
}
