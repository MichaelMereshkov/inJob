//
//  AddViewModel.swift
//  inJob
//
//  Created by Михаил Мерешков on 05.11.2022.
//

import Foundation
import UIKit

protocol AddViewModelProtocol: AnyObject {
    
    // MARK: - Properties
    
    var location: [String] { get }
    
    // MARK: - Functions
    
    func didTapAddButton()
}

final class AddViewModel: AddViewModelProtocol {

    // MARK: - Constants


    // MARK: - Properties

    var router: AddRouterProtocol
    var location = ["Али-Юрт","Алхасты", "Армхи", "Ачалуки", "Барсуки", "Вр. Ачалуки", "Гази юрт", "Галашки", "Джейрах", "Долаково", "Зязиков юрт", "Кантышево", "Карабулак", "Магас", "Майское", "Малгобек", "Мужичи", "Назрань", "Нестеровская", "Плиево", "Сагопши", "Слепцовск", "Ср. Ачалуки", "Сунжа", "Сурхахи", "Троицкая", "Чермен", "Экажево", "Яндаре",]
    
    // MARK: - Private properties

    // MARK: - Private properties

    

    // MARK: - Constructor

    init(router: AddRouterProtocol) {
        self.router = router
    }

    // MARK: - Functions


    // MARK: - Private functions
    
    func didTapAddButton() {
        router.goToMainScreen()
    }
}

