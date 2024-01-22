//
//  ProductView.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 21/1/24.
//

import SwiftUI

struct ProductView: View {
    @ObservedObject var viewModel: ProductViewModel
    let product: Product

    init(product: Product, container: DependencyContainer) {
        self.product = product
        self.viewModel = container.makeProductViewModel(product: product)
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 30) {
                Image(product.id)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 400)
                    .padding(.horizontal)

                HStack {
                    ForEach(1...5, id: \.self) { index in
                        Image(systemName: index <= product.review ? "star.fill" : "star")
                    }
                }
                .padding(.horizontal)

                Text(product.description)
                    .padding(.horizontal)
                    .foregroundColor(.gray)

                HStack(alignment: .center) {
                    Text("\(product.price, format: .number.precision(.fractionLength(2))) €")
                        .font(.title)
                        .padding(.leading)

                    Button(action: viewModel.addToBasket) {
                        Text("Add to Basket")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.customBlue)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                }
            }
        }
        .navigationBarItems(trailing: Button(action: viewModel.markAsFavourite) {
            Image(systemName: viewModel.isFavourite ? "heart.fill" : "heart")
                .foregroundColor(.red)
        })
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(product.name).font(.headline).foregroundColor(.gray)
            }
        }
    }
}
