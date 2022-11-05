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
        
        allItems.append(SearchItemsViewModel(image: #imageLiteral(resourceName: "sad"), title: "Вспахать огород", value: "Нужно вспахать огород, земля 5 соток, все инструменты имеются.", location: "Назрань", sum: 4000))
        sections.append(SectionItemsViewModel(items: allItems))
    }

    // MARK: - Functions


    // MARK: - Private functions
    
    func didTapAddButton() {
    }
}
