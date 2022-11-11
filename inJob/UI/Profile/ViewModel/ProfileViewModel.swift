//
//  ProfileViewModel.swift
//  inJob
//
//  Created by Михаил Мерешков on 05.11.2022.
//

import Foundation

protocol ProfileViewModelProtocol: AnyObject {
    
    // MARK: - Functions

    func didTapAddButton()
}

final class ProfileViewModel: ProfileViewModelProtocol {

    // MARK: - Constants


    // MARK: - Properties

    var router: ProfileRouterProtocol
    var sections: [SectionViewModelProtocol] = []
    
    // MARK: - Private properties
    
    private var title: String?

    // MARK: - Private properties

    

    // MARK: - Constructor

    init(router: ProfileRouterProtocol) {
        self.router = router
    }

    // MARK: - Functions
    
    func didTapAddButton() {
        router.moveToMyAdd()
    }
    
    // MARK: - Private functions
}

