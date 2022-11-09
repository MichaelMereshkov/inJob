//
//  AddBuilder.swift
//  inJob
//
//  Created by Михаил Мерешков on 05.11.2022.
//

import UIKit

final class AddBuilder {

    // MARK: - Functions

    static func build() -> UIViewController {
        let router = SearchRouter()
        let viewModel = AddViewModel(router: router)
        let controller = AddController(viewModel: viewModel)
        router.presenter = controller
        return controller
    }
}
