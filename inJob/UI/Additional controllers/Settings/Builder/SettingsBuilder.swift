//
//  SettingsBuilder.swift
//  inJob
//
//  Created by Михаил Мерешков on 10.11.2022.
//

import UIKit

final class SettingsBuilder {

    // MARK: - Functions

    static func build() -> UIViewController {
        let router = SettingsRouter()
        let viewModel = SettingsViewModel(router: router)
        let controller = SettingsController(viewModel: viewModel)
        router.presenter = controller
        return controller
    }
}
