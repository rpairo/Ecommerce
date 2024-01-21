//
//  Categoriable.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 21/1/24.
//

import Foundation

protocol Categoriable {
    func fetchCategories(completion: @escaping CategoryResult)
}
