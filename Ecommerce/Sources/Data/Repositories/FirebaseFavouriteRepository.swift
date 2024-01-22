//
//  FirebaseFavouriteRepository.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 22/1/24.
//

import Foundation
import FirebaseFirestore

class FirebaseFavouriteRepository: Favouritable {

    private let database = Firestore.firestore()
    func favourite(for product: Product, to: Bool, completion: @escaping ToggleFavouriteResult) {
        database.collection("products").document(product.id).updateData([
            "favourite": to
        ]) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(to))
            }
        }
    }
}
