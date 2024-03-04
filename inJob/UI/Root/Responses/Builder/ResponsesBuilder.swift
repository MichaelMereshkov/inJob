//
//  ResponsesBuilder.swift
//  inJob
//
//  Created by Михаил Мерешков on 05.11.2022.
//

import UIKit

final class ResponsesBuilder {

    // MARK: - Functions

    static func build() -> UIViewController {
        let router = SearchRouter()
        let viewModel = ResponsesViewModel(router: router)
        let controller = ResponsesController(viewModel: viewModel)
        router.presenter = controller
        return controller
    }
}
