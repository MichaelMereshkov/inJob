//
//  ContactsBuilder.swift
//  inJob
//
//  Created by Михаил Мерешков on 08.11.2022.
//

import UIKit

final class ContactsBuilder {

    // MARK: - Functions

    static func build(textName: String, textPhone: String, textMail: String) -> UIViewController {
        let router = ContactsRouter()
        let viewModel = ContactsViewModel(router: router, textName: textName, textPhone: textPhone, textMail: textMail)
        let controller = ContactsController(viewModel: viewModel)
        router.presenter = controller
        if #available(iOS 15.0, *) {
            controller.view.layer.cornerRadius = 30
            controller.sheetPresentationController?.detents = [.medium()]
        }
        return controller
    }
}
