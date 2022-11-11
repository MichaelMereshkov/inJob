//
//  MyAddBuilder.swift
//  inJob
//
//  Created by Михаил Мерешков on 10.11.2022.
//

import UIKit

final class MyAddBuilder {

    // MARK: - Functions

    static func build() -> UIViewController {
        let router = SearchRouter()
        let viewModel = MyAddViewModel(router: router)
        let controller = MyAddController(viewModel: viewModel)
        router.presenter = controller
        return controller
    }
}
