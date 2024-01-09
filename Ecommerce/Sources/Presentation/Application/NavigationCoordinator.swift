//
//  NavigationCoordinator.swift
//  Ecommerce
//
//  Created by Raúl Pera Pairó on 4/1/24.
//

import Foundation
import SwiftUI

class NavigationCoordinator: ObservableObject {
    @Published var path = NavigationPath()

    func navigate(to destination: NavigationDestination) {
        path.append(destination)
    }

    func popToRoot() {
        path.removeLast(path.count)
    }

    func popBack() {
        if path.count > 0 {
            path.removeLast()
        }
    }
}

enum NavigationDestination: Hashable {
    case login
    case register
}
