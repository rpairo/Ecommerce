//
//  MainTabView.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 30/12/23.
//

import SwiftUI

struct MainTabView: View {
    // MARK: - Properties
    let container: DependencyContainer

    init(container: DependencyContainer) {
        self.container = container
    }

    // MARK: - Views
    var body: some View {
        TabView {
            DiscoverView(container: self.container).tabItem {
                Label("Discover", systemImage: "magnifyingglass")
            }
            CatalogView(container: self.container).tabItem {
                Label("Catalog", systemImage: "list.bullet")
            }
            CartView(container: self.container).tabItem {
                Label("Cart", systemImage: "cart")
            }
            FavoritesView(container: self.container).tabItem {
                Label("Favorites", systemImage: "heart")
            }
            SettingsView(container: self.container).tabItem {
                Label("Settings", systemImage: "gear")
            }
        }
    }
}
