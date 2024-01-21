//
//  CategoryView.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 21/1/24.
//

import SwiftUI

struct CategoryView: View {
    @ObservedObject var viewModel: CategoryViewModel
    let container: DependencyContainer
    let category: Category

    // MARK: - Constructors
    init(category: Category, container: DependencyContainer) {
        self.category = category
        self.container = container
        self.viewModel = container.makeCategoryViewModel(category: category)
    }

    var body: some View {
        VStack {
            headerView
            productList
        }
        .edgesIgnoringSafeArea(.top)
        .onAppear {
            viewModel.loadProducts()
        }
    }

    var headerView: some View {
        ZStack(alignment: .bottom) {
            Image(category.id)
                .resizable()
                .scaledToFill()
                .frame(height: 260)

            VStack {
                Text(category.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                Text(category.description)
                    .font(.headline)
                    .foregroundColor(.white.opacity(0.7))
            }
            .frame(height: 260)
        }
    }

    var productList: some View {
        List(viewModel.products) { product in
            NavigationLink(destination: ProductView(product: product)) {
                ProductRow(product: product)
            }
        }
        .listStyle(PlainListStyle())
    }
}

struct ProductRow: View {
    let product: Product

    var body: some View {
        HStack(alignment: .top) {
            Image(product.id)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 100)

            VStack(alignment: .leading) {
                Text(product.name)
                    .foregroundColor(.gray)
                    .font(.headline)
                    .padding(.bottom, 10)
                    .padding(.horizontal, 20)

                Text(product.manufacturer)
                    .foregroundColor(.gray)
                    .font(.subheadline)
                    .padding(.horizontal, 20)

                Text("\(product.price, format: .number.precision(.fractionLength(2))) €")
                    .font(.body)
                    .padding(.top, 10)
                    .padding(.horizontal, 20)
            }
        }
    }
}
