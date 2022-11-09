//
//  SearchViewModel.swift
//  inJob
//
//  Created by Михаил Мерешков on 05.11.2022.
//

import Foundation

protocol SearchViewModelProtocol: AnyObject {
    
    // MARK: - Properties

    var sections: [SectionViewModelProtocol] { get }
    
    // MARK: - Functions

    func fetch()
}

final class SearchViewModel: SearchViewModelProtocol {

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
        
        var items = [TableCellViewModelProtocol]()
        items.append(SearchItemsViewModel(image: #imageLiteral(resourceName: "sad"), title: "Вспахать огород 6", value: "Нужно вспахать огород, земля 5 соток, все инструменты имеются.", location: "Назрань", sum: 4000, textName: "Дурак Никита", textPhone: "+7(928)232-36-89", textMail: "digital@mail.ru", router: router))
        items.append(SearchItemsViewModel(image: #imageLiteral(resourceName: "sad"), title: "Вспахать огород 6", value: "Нужно вспахать огород, земля 5 соток, все инструменты имеются.", location: "Назрань", sum: 4000, textName: "Дурак Никита", textPhone: "+7(928)232-36-89", textMail: "digital@mail.ru", router: router))
        items.append(SearchItemsViewModel(image: #imageLiteral(resourceName: "sad"), title: "Вспахать огород 6", value: "Нужно вспахать огород, земля 5 соток, все инструменты имеются.", location: "Назрань", sum: 4000, textName: "Дурак Никита", textPhone: "+7(928)232-36-89", textMail: "digital@mail.ru", router: router))
        
        sections.append(SectionItemsViewModel(items: items))
    }

    // MARK: - Functions

    func fetch() {
        sections.append(SectionItemsViewModel(items: allItems))
    }

    // MARK: - Private functions
    
    func didTapAddButton() {
    }
}
