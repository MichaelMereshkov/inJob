//
//  ProfileBuilder.swift
//  inJob
//
//  Created by Михаил Мерешков on 05.11.2022.
//

import UIKit

final class ProfileBuilder {

    // MARK: - Functions

    static func build() -> UIViewController {
        let router = ProfileRouter()
        let viewModel = ProfileViewModel(router: router)
        let controller = ProfileController(viewModel: viewModel)
        router.presenter = controller
        return controller
    }
}
