//
//  MyAddViewModel.swift
//  inJob
//
//  Created by Михаил Мерешков on 10.11.2022.
//

import Foundation

protocol MyAddViewModelProtocol: AnyObject {
    
    // MARK: - Properties

    var sections: [SectionViewModelProtocol] { get }
}

final class MyAddViewModel: MyAddViewModelProtocol {

    // MARK: - Constants


    // MARK: - Properties

    var router: MyAddRouterProtocol
    var sections: [SectionViewModelProtocol] = []
    
    // MARK: - Private properties
    
    private var title: String?

    // MARK: - Private properties

    

    // MARK: - Constructor

    init(router: MyAddRouterProtocol) {
        self.router = router
    }

    // MARK: - Functions


    // MARK: - Private functions
    
    func didTapAddButton() {
    }
}
