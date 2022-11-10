//
//  AddViewModel.swift
//  inJob
//
//  Created by Михаил Мерешков on 05.11.2022.
//

import Foundation
import UIKit

protocol AddViewModelProtocolDelegate: AnyObject {
    
    // MARK: - Functions
    
    func saveItems(image: UIImage?, title: String, value: String, location: String, sum: Int, textName: String, textPhone: String, textMail: String)
}

protocol AddViewModelProtocol: AnyObject {
    
    // MARK: - Properties

    var router: SearchRouterProtocol { get }
    var sections: [SectionViewModelProtocol] { get }
}

final class AddViewModel: AddViewModelProtocol {

    // MARK: - Constants


    // MARK: - Properties

    var router: SearchRouterProtocol
    var sections: [SectionViewModelProtocol] = []
    
    // MARK: - Private properties
    
    private var title: String?

    // MARK: - Private properties

    

    // MARK: - Constructor

    init(router: SearchRouterProtocol) {
        self.router = router
        //var item = [TableCellViewModelProtocol]()
//        item.append(AddItemsViewModel(title: "Название / категория", result: 10, keyboardType: .default))
//        sections.append(SectionItemsViewModel(items: item))
    }

    // MARK: - Functions


    // MARK: - Private functions
    
    func didTapAddButton() {
    }
}

