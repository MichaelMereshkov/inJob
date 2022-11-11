//
//  ProfileRouter.swift
//  inJob
//
//  Created by Михаил Мерешков on 05.11.2022.
//

import UIKit

protocol ProfileRouterProtocol: AnyObject {
    
    // MARK: - Functions
    
    func moveToMyAdd()
}

final class ProfileRouter: ProfileRouterProtocol {
    
    // MARK: - Properties
    
    weak var presenter: UIViewController?
    
    // MARK: - Functions
    
    func moveToMyAdd() {
        let controller = MyAddBuilder.build()
        presenter?.navigationController?.pushViewController(controller, animated: true)
    }
    
}
