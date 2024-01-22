//
//  CartViewModel.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 9/1/24.
//

import Foundation
import PassKit

class CartViewModel: NSObject, ObservableObject {
    @Published var products: [Product] = []
    @Published var isLoading = false
    private let cartUseCase: CartUseCaseProtocol
    @Published var canMakePayments = PKPaymentAuthorizationController.canMakePayments()

    var totalPrice: Decimal {
        return products.reduce(0) { $0 + $1.price }
    }

    init(cartUseCase: CartUseCaseProtocol) {
        self.cartUseCase = cartUseCase
    }

    func loadProducts() {
        isLoading = true
        cartUseCase.execFetchCart { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let products):
                    self?.products = products
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }

    func presentApplePay() {
        let request = PKPaymentRequest()

        let paymentController = PKPaymentAuthorizationController(paymentRequest: request)
        paymentController.delegate = self
        paymentController.present { success in
            if success {
                // Controlador presentado con éxito
            } else {
                // Error al presentar el controlador
            }
        }
    }

    private func createPaymentRequest() -> PKPaymentRequest {
           let request = PKPaymentRequest()
           request.countryCode = "ES"
           request.currencyCode = "EUR"
           request.merchantIdentifier = "your.merchant.identifier"
           request.merchantCapabilities = .threeDSecure
           request.supportedNetworks = [.visa, .masterCard, .amex]
           request.paymentSummaryItems = [
               PKPaymentSummaryItem(label: "Total", amount: NSDecimalNumber(decimal: totalPrice))
           ]

           return request
       }
}

extension CartViewModel: PKPaymentAuthorizationControllerDelegate {
    func paymentAuthorizationController(_ controller: PKPaymentAuthorizationController, didAuthorizePayment payment: PKPayment, handler completion: @escaping (PKPaymentAuthorizationResult) -> Void) {
        // Procesar el pago aquí
    }

    func paymentAuthorizationControllerDidFinish(_ controller: PKPaymentAuthorizationController) {
        controller.dismiss {
            // Manejar el final de la transacción
        }
    }
}
