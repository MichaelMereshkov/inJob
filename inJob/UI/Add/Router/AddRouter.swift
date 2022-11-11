//
//  AddRouter.swift
//  inJob
//
//  Created by Михаил Мерешков on 05.11.2022.
//

import UIKit

protocol AddRouterProtocol: AnyObject {
    
    // MARK: - Functions
    
    func goToMainScreen()
}

final class AddRouter: AddRouterProtocol {

    // MARK: - Properties

    weak var presenter: UIViewController?

    // MARK: - Functions
    
    func goToMainScreen() {
        let infoAlert = UIAlertController(title: "Вы добавили новое объявление", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ок", style: .cancel)
        infoAlert.addAction(okAction)
        infoAlert.modalPresentationStyle = .fullScreen
        presenter?.present(infoAlert, animated: true)
    }
}

