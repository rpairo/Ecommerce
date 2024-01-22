//
//  FirebaseCategoryRepository.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 21/1/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class FirebaseCategoryRepository: Categoriable {
    private let database = Firestore.firestore()

    func fetchCategories(completion: @escaping CategoryResult) {
        database.collection("categories").getDocuments { snapshot, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            let categories = snapshot?.documents.compactMap { document -> Category? in
                guard let dto = try? document.data(as: CategoryDTO.self) else { return nil }

                return Category(
                    id: document.documentID,
                    name: dto.name,
                    description: dto.description
                )
            } ?? []
            completion(.success(categories))
        }
    }
}
