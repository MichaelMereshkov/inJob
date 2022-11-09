//
//  ContactsViewModel.swift
//  inJob
//
//  Created by Михаил Мерешков on 08.11.2022.
//

import Foundation

protocol ContactsViewModelProtocol: AnyObject {
    
    // MARK: - Properties

    var textName: String { get }
    var textPhone: String { get }
    var textMail: String { get }
}

final class ContactsViewModel: ContactsViewModelProtocol {

    // MARK: - Constants


    // MARK: - Properties

    var router: ContactsRouterProtocol
    
    // MARK: - Properties

    var textName: String
    var textPhone: String
    var textMail: String

    // MARK: - Private properties

    

    // MARK: - Constructor

    init(router: ContactsRouterProtocol, textName: String, textPhone: String, textMail: String) {
        self.router = router
        self.textName = textName
        self.textPhone = textPhone
        self.textMail = textMail
    }

    // MARK: - Functions


    // MARK: - Private functions
    
    func didTapAddButton() {
    }
}


