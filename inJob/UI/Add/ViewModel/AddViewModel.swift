//
//  AddViewModel.swift
//  inJob
//
//  Created by Михаил Мерешков on 05.11.2022.
//

import Foundation

protocol AddViewModelProtocol: AnyObject {
    
    // MARK: - Properties

    var sections: [SectionViewModelProtocol] { get }
}

final class AddViewModel: AddViewModelProtocol {

    // MARK: - Constants


    // MARK: - Properties

    var router: AddRouterProtocol
    var sections: [SectionViewModelProtocol] = []
    
    // MARK: - Private properties
    
    private var title: String?

    // MARK: - Private properties

    

    // MARK: - Constructor

    init(router: AddRouterProtocol) {
        self.router = router
    }

    // MARK: - Functions


    // MARK: - Private functions
    
    func didTapAddButton() {
    }
}

