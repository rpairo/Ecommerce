//
//  FirebaseProductRepository.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 21/1/24.
//

import FirebaseFirestore

class FirebaseProductRepository: Productable {
    private let database = Firestore.firestore()

    func fetchProducts(for category: String, completion: @escaping (Result<[Product], Error>) -> Void) {
        database.collection("products")
            .whereField("category", isEqualTo: category)
            .getDocuments { (querySnapshot, error) in
            if let error = error {
                completion(.failure(error))
                return
            }

            let products = querySnapshot?.documents.compactMap { document -> Product? in
                print(document.documentID)
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

    func fetchFavouriteProducts(completion: @escaping (Result<[Product], Error>) -> Void) {
        database.collection("products")
            .whereField("favourite", isEqualTo: true)
            .getDocuments { (querySnapshot, error) in
            if let error = error {
                completion(.failure(error))
                return
            }

            let products = querySnapshot?.documents.compactMap { document -> Product? in
                print(document.documentID)
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
