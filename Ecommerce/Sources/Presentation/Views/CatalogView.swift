//
//  CatalogView.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 31/12/23.
//

import SwiftUI

struct CatalogView: View {
    @State private var searchText = ""
    @ObservedObject var viewModel: CatalogViewModel
    let container: DependencyContainer

    // MARK: - Constructors
    init(container: DependencyContainer) {
        self.container = container
        self.viewModel = container.makeCatalogViewModel()
    }

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 1) {
                    SearchBar(searchText: $searchText)
                    ForEach(viewModel.filteredCategories, id: \.id) { category in
                        CategoryCell(category: category)
                    }
                }
                .navigationBarTitle("Catalog", displayMode: .large)
            }
            .background(Color.white)
            .scrollIndicators(.never)
        }
        .onAppear {
            viewModel.loadCategories()
        }
        .onChange(of: searchText) {
            viewModel.filterCategories(with: searchText)
        }
    }
}

struct SearchBar: View {
    @Binding var searchText: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Buscar", text: $searchText)
                .foregroundColor(.customBlue)
            Image(systemName: "mic.fill")
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .padding()
    }
}

struct CategoryCell: View {
    let category: Category

    var body: some View {
        ZStack(alignment: .center) {
            Image(category.id)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .shadow(radius: 5)

            TextOverlayView(category: category)
        }
    }
}

struct TextOverlayView: View {
    let category: Category

    var body: some View {
        VStack(alignment: .center) {
            Text(category.name)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
            Text(category.description)
                .font(.subheadline)
                .foregroundColor(.white)
        }
        .padding()
    }
}
