//
//  CartView.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 31/12/23.
//

import SwiftUI
import PassKit

struct CartView: View {
    @ObservedObject var viewModel: CartViewModel
    let container: DependencyContainer

    init(container: DependencyContainer) {
        self.container = container
        self.viewModel = container.makeCartViewModel()
    }

    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.products) { product in
                    ProductCartRow(product: product)
                }
                .listStyle(PlainListStyle())
                .background(Color.white)
                .scrollIndicators(.never)

                Divider()

                VStack {
                    HStack {
                        Text("Total:")
                            .font(.title3)
                            .foregroundColor(.gray)
                        Spacer()
                        Text(viewModel.totalPrice, format: .currency(code: "EUR"))
                            .font(.title3)
                    }
                    .padding()

                    Divider()

                    PayWithApplePayButton {
                        viewModel.presentApplePay()
                    }
                    .disabled(!viewModel.canMakePayments)
                    .payWithApplePayButtonStyle(.whiteOutline)
                    .frame(height: 50)
                    .padding()
                }
                .padding(.bottom, 10)
            }
            .navigationBarTitle("Cart", displayMode: .large)
        }
        .onAppear {
            viewModel.loadProducts()
        }
    }
}

struct ProductCartRow: View {
    let product: Product

    var body: some View {
        HStack(alignment: .top) {
            Image(product.id)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 100)

            VStack(alignment: .leading) {
                Text(product.name)
                    .font(.headline)
                    .foregroundColor(.gray)
                    .padding(.bottom, 10)
                    .padding(.horizontal, 20)

                HStack {
                    Text("Quantity")
                        .foregroundColor(.gray)
                        .font(.footnote)
                    Spacer()
                    Text("\(1)")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal, 20)

                HStack {
                    Text("Size")
                        .font(.footnote)
                        .foregroundColor(.gray)
                    Spacer()
                    Text("\(product.size)")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal, 20)

                HStack {
                    Text("Price")
                        .font(.footnote)
                        .foregroundColor(.gray)
                    Spacer()
                    Text("\(product.price, format: .currency(code: "EUR"))")
                        .font(.footnote)
                }
                .padding(.horizontal, 20)
            }
        }
    }
}
