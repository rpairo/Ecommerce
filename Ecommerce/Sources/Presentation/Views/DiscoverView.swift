//
//  DiscoverView.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 31/12/23.
//

import SwiftUI

struct DiscoverView: View {
    // MARK: - Properties
    let container: DependencyContainer

    @ObservedObject var viewModel: DiscoverViewModel

    let cards: [Card] = [
        Card(image: "discover_card_1", title: "The Art of \nOlive Growing", description: "Delve into the Extraordinary World of Oil Study", category: "Gourmet"),
        Card(image: "discover_card_2", title: "Table of Foie Gras", description: "Delve into the Extraordinary Flavor of Foie Gras and Its Pairings", category: "Tasting"),
    ]


    init(container: DependencyContainer) {
        self.container = container
        self.viewModel = container.makeDiscoveryViewModel()
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ForEach(cards) { card in
                        CardView(card: card)
                            .padding(16)
                    }
                }
            }
            .navigationTitle("Discover")
        }
    }
}

struct Card: Identifiable {
    let id = UUID()
    let image: String
    let title: String
    let description: String
    let category: String
}

struct CardView: View {
    let card: Card

    var body: some View {
        ZStack(alignment: .leading) {
            Image(card.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .cornerRadius(20)
                .overlay(
                    Rectangle()
                        .foregroundColor(Color("card-transparency"))
                        .opacity(0.6)
                        .cornerRadius(20)
                )
                //.shadow(color: Color.gray.opacity(0.5), radius: 10, x: 0, y: 10)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)

            VStack(alignment: .leading) {
                Text(card.category)
                    .font(.caption)
                    .textCase(.uppercase)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .opacity(0.8)
                    .padding(.top)
                    .padding(.leading)
                    .padding(.bottom, 1)

                Text(card.title)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .opacity(0.8)
                    .padding(.leading)
                Spacer()
                Text(card.description)
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .opacity(0.8)
                    .padding()
            }
        }
    }
}
