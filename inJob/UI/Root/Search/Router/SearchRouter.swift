//
//  SearchRouter.swift
//  inJob
//
//  Created by Михаил Мерешков on 05.11.2022.
//

import UIKit

 public protocol SearchRouterProtocol: AnyObject {
    
    // MARK: - Functions
    
    func openContacts(textName: String, textPhone: String, textMail: String)
}

final class SearchRouter: SearchRouterProtocol {

    // MARK: - Properties

    weak var presenter: UIViewController?

    // MARK: - Functions
    
    func openContacts(textName: String, textPhone: String, textMail: String) {
        let controller = ContactsBuilder.build(textName: textName, textPhone: textPhone, textMail: textMail)
        presenter?.present(controller, animated: true)
    }
    
}
