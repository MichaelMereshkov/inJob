//
//  SettingsViewModel.swift
//  inJob
//
//  Created by Михаил Мерешков on 10.11.2022.
//

import Foundation

protocol SettingsViewModelProtocol: AnyObject {
    
    // MARK: - Properties

    var sections: [SectionViewModelProtocol] { get }
}

final class SettingsViewModel: SettingsViewModelProtocol {

    // MARK: - Constants


    // MARK: - Properties

    var router: SettingsRouterProtocol
    var sections: [SectionViewModelProtocol] = []
    
    // MARK: - Private properties
    
    private var title: String?

    // MARK: - Private properties

    

    // MARK: - Constructor

    init(router: SettingsRouterProtocol) {
        self.router = router
    }

    // MARK: - Functions


    // MARK: - Private functions
    
    func didTapAddButton() {
    }
}
