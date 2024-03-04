//
//  SearchBuilder.swift
//  inJob
//
//  Created by Михаил Мерешков on 05.11.2022.
//

import UIKit

final class SearchBuilder {

    // MARK: - Functions

    static func build() -> UIViewController {
        let router = SearchRouter()
        let viewModel = SearchViewModel(router: router)
        let controller = SearchController(viewModel: viewModel)
        router.presenter = controller
        return controller
    }
}
