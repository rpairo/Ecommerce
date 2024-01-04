//
//  MainTabView.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 30/12/23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            DiscoverView().tabItem {
                Label("Discover", systemImage: "magnifyingglass")
            }
            CatalogView().tabItem {
                Label("Catalog", systemImage: "list.bullet")
            }
            CartView().tabItem {
                Label("Cart", systemImage: "cart")
            }
            FavoritesView().tabItem {
                Label("Favorites", systemImage: "heart")
            }
            SettingsView().tabItem {
                Label("Settings", systemImage: "gear")
            }
        }
    }
}

#Preview {
    MainTabView()
}
