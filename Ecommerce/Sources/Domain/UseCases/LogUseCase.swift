//
//  LogUseCase.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 9/1/24.
//

import Foundation

class LogUseCase: LogUseCaseProtocol {
    private let repository: Logable

    init(repository: Logable) {
        self.repository = repository
    }
}
