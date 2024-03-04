//
//  ResponsesViewModel.swift
//  inJob
//
//  Created by Михаил Мерешков on 05.11.2022.
//

import Foundation

protocol ResponsesViewModelProtocol: AnyObject {
    
    // MARK: - Properties

    var items: [TableCellViewModelProtocol] { get }
}

final class ResponsesViewModel: ResponsesViewModelProtocol {

    // MARK: - Constants


    // MARK: - Properties

    var router: SearchRouterProtocol
    var items: [TableCellViewModelProtocol] = []

    // MARK: - Constructor

    init(router: SearchRouterProtocol) {
        self.router = router
        items.append(SearchItemsViewModel(image: #imageLiteral(resourceName: "log1"), title: "Собрать кухонную мебель", value: "Ищу специалиста который быстро соберет кухонную мебель, собрать нужно без царапин и сколов.", location: "Сунжа", sum: 150000, textName: "Дмитрий Резняк", textPhone: "+7(928)***-02-61", textMail: "inJob@inJob.ru", isLaik: false, isFavorite: true, router: router))
        
        items.append(SearchItemsViewModel(image: #imageLiteral(resourceName: "sad"), title: "Вспахать огород", value: "Нужно вспахать огород, земля 10 соток, все инструменты имеются.", location: "Назрань", sum: 10000, textName: "Василий Петров", textPhone: "+7(928)***-54-89", textMail: "inJob@inJob.ru", isLaik: false, isFavorite: true, router: router))
        
        items.append(SearchItemsViewModel(image: #imageLiteral(resourceName: "log9"), title: "Починить кран", value: "Ищу сантихника, нужно починить кран.", location: "Назрань", sum: 1500, textName: "Михаил Коваль", textPhone: "+7(928)***-64-94", textMail: "inJob@inJob.ru", isLaik: false, isFavorite: true, router: router))
    }
}

