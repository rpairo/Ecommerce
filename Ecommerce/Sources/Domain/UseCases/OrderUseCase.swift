//
//  OrderUseCase.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 9/1/24.
//

import Foundation

class OrderUseCase: OrderUseCaseProtocol {
    
    private let repository: Ordeable

    init(repository: Ordeable) {
        self.repository = repository
    }
}
