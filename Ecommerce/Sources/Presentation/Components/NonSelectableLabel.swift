//
//  NonSelectableLabel.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 20/1/24.
//

import SwiftUI

struct NonSelectableLabel: UIViewRepresentable {
    var text: String
    var textColor: UIColor

    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.textColor = textColor
        label.text = text
        label.textAlignment = .right
        return label
    }

    func updateUIView(_ uiView: UILabel, context: Context) {
        uiView.text = text
        uiView.textColor = textColor
    }
}
