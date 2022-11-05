//
//  FavoritesBuilder.swift
//  inJob
//
//  Created by Михаил Мерешков on 05.11.2022.
//

import UIKit

final class FavoritesBuilder {

    // MARK: - Functions

    static func build() -> UIViewController {
        let router = FavoritesRouter()
        let viewModel = FavoritesViewModel(router: router)
        let controller = FavoritesController(viewModel: viewModel)
        router.presenter = controller
        return controller
    }
}
