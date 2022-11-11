//
//  AboutUsViewModel.swift
//  inJob
//
//  Created by Михаил Мерешков on 10.11.2022.
//

import Foundation

protocol AboutUsViewModelProtocol: AnyObject {
    
    // MARK: - Properties

    var sections: [SectionViewModelProtocol] { get }
}

final class AboutUsViewModel: AboutUsViewModelProtocol {

    // MARK: - Constants


    // MARK: - Properties

    var router: AboutUsRouterProtocol
    var sections: [SectionViewModelProtocol] = []
    
    // MARK: - Private properties
    
    private var title: String?

    // MARK: - Private properties

    

    // MARK: - Constructor

    init(router: AboutUsRouterProtocol) {
        self.router = router
    }

    // MARK: - Functions


    // MARK: - Private functions
    
    func didTapAddButton() {
    }
}
