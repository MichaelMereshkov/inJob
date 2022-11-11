//
//  MyAddRouter.swift
//  inJob
//
//  Created by Михаил Мерешков on 10.11.2022.
//

import UIKit

protocol MyAddRouterProtocol: AnyObject {
    
    // MARK: - Functions
    
    func dismiss()
}

final class MyAddRouter: MyAddRouterProtocol {

    // MARK: - Properties

    weak var presenter: UIViewController?

    // MARK: - Functions
    
    func dismiss() {
        presenter?.navigationController?.popViewController(animated: true)
    }
}
