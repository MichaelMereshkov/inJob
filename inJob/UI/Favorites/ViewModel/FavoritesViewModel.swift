//
//  FavoritesViewModel.swift
//  inJob
//
//  Created by Михаил Мерешков on 05.11.2022.
//

import Foundation

protocol FavoritesViewModelProtocol: AnyObject {
    
    // MARK: - Properties

    var sections: [SectionViewModelProtocol] { get }
}

final class FavoritesViewModel: FavoritesViewModelProtocol {

    // MARK: - Constants


    // MARK: - Properties

    var router: FavoritesRouterProtocol
    var sections: [SectionViewModelProtocol] = []
    
    // MARK: - Private properties
    
    private var title: String?

    // MARK: - Private properties

    

    // MARK: - Constructor

    init(router: FavoritesRouterProtocol) {
        self.router = router
    }

    // MARK: - Functions


    // MARK: - Private functions
    
    func didTapAddButton() {
    }
}

