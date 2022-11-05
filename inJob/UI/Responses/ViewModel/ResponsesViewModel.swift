//
//  ResponsesViewModel.swift
//  inJob
//
//  Created by Михаил Мерешков on 05.11.2022.
//

import Foundation

protocol ResponsesViewModelProtocol: AnyObject {
    
    // MARK: - Properties

    var sections: [SectionViewModelProtocol] { get }
}

final class ResponsesViewModel: ResponsesViewModelProtocol {

    // MARK: - Constants


    // MARK: - Properties

    var router: ResponsesRouterProtocol
    var sections: [SectionViewModelProtocol] = []
    
    // MARK: - Private properties
    
    private var title: String?

    // MARK: - Private properties

    

    // MARK: - Constructor

    init(router: ResponsesRouterProtocol) {
        self.router = router
    }

    // MARK: - Functions


    // MARK: - Private functions
    
    func didTapAddButton() {
    }
}

