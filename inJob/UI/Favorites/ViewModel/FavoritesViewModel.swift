//
//  FavoritesViewModel.swift
//  inJob
//
//  Created by Михаил Мерешков on 05.11.2022.
//

import Foundation

protocol FavoritesViewModelProtocol: AnyObject {
    
    // MARK: - Properties

    var items: [TableCellViewModelProtocol] { get }
}

final class FavoritesViewModel: FavoritesViewModelProtocol {

    // MARK: - Constants


    // MARK: - Properties

    var router: SearchRouterProtocol
    var items: [TableCellViewModelProtocol] = []
    
    // MARK: - Private properties
    
    private var title: String?

    // MARK: - Private properties

    

    // MARK: - Constructor

    init(router: SearchRouterProtocol) {
        self.router = router
        items.append(SearchItemsViewModel(image: #imageLiteral(resourceName: "log5"), title: "Кладка", value: "Нужен хороший мастер по кладке, дом 10х10.", location: "Назрань", sum: 100000, textName: "Даниел Корнаев", textPhone: "+7(928)***-21-14", textMail: "inJob@inJob.ru", isLaik: true, isFavorite: false, router: router))
        
        items.append(SearchItemsViewModel(image: #imageLiteral(resourceName: "log7"), title: "Уборка территории", value: "Нужны люди для уборки территории разбером 50 соток, сумма указана за дневной оклад.", location: "Магас", sum: 2000, textName: "Андрей Волков", textPhone: "+7(928)***-44-11", textMail: "inJob@inJob.ru", isLaik: true, isFavorite: false, router: router))
        
        items.append(SearchItemsViewModel(image: #imageLiteral(resourceName: "log4"), title: "Проложить отопление", value: "Ищу специалиста который проложит отопление в новом доме, квадратура 300кв.", location: "Плиево", sum: 150000, textName: "Руслан Исаков", textPhone: "+7(928)***-11-33", textMail: "inJob@inJob.ru", isLaik: true, isFavorite: false, router: router))
    }

    // MARK: - Functions


    // MARK: - Private functions
    
    func didTapAddButton() {
    }
}

