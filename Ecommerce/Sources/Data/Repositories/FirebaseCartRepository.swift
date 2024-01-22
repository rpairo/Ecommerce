//
//  FirebaseCartRepository.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 22/1/24.
//

import Foundation
import FirebaseFirestore

class FirebaseCartRepository: Cartable {

    private let database = Firestore.firestore()

    func addToCart(product: Product, completion: @escaping AddToCartResult) {
        let document = database.collection("cart").document(product.id)

        let data: [String: Any] = [
            "id": product.id,
            "manufacturer": product.manufacturer,
            "description": product.description,
            "favourite": product.favourite,
            "name": product.name,
            "price": product.price,
            "review": product.review,
            "size": product.size
        ]

        document.setData(data) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(true))
            }
        }
    }

    func fetchCart(completion: @escaping CartResult) {
        database.collection("cart").getDocuments { snapshot, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            let products = snapshot?.documents.compactMap { document -> Product? in
                guard let productDTO = try? document.data(as: ProductDTO.self) else { return nil }

                return Product(
                    id: document.documentID,
                    manufacturer: productDTO.manufacturer,
                    description: productDTO.description,
                    favourite: productDTO.favourite,
                    name: productDTO.name,
                    price: Decimal(productDTO.price),
                    review: productDTO.review,
                    size: productDTO.size)
            } ?? []
            completion(.success(products))
        }
    }
}
