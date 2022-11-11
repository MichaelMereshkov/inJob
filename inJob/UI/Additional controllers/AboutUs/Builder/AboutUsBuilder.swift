//
//  AboutUsBuilder.swift
//  inJob
//
//  Created by Михаил Мерешков on 10.11.2022.
//

import UIKit

final class AboutUsBuilder {

    // MARK: - Functions

    static func build() -> UIViewController {
        let router = AboutUsRouter()
        let viewModel = AboutUsViewModel(router: router)
        let controller = AboutUsController(viewModel: viewModel)
        router.presenter = controller
        return controller
    }
}
