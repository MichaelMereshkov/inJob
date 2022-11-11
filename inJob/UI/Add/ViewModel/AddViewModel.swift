//
//  AddViewModel.swift
//  inJob
//
//  Created by Михаил Мерешков on 05.11.2022.
//

import Foundation
import UIKit

protocol AddViewModelProtocol: AnyObject {
    
    // MARK: - Properties
    
    // MARK: - Functions
    
    func didTapAddButton()
}

final class AddViewModel: AddViewModelProtocol {

    // MARK: - Constants


    // MARK: - Properties

    var router: AddRouterProtocol
    
    // MARK: - Private properties

    // MARK: - Private properties

    

    // MARK: - Constructor

    init(router: AddRouterProtocol) {
        self.router = router
    }

    // MARK: - Functions


    // MARK: - Private functions
    
    func didTapAddButton() {
        router.goToMainScreen()
    }
}

