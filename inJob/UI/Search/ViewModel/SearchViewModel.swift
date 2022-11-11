//
//  SearchViewModel.swift
//  inJob
//
//  Created by Михаил Мерешков on 05.11.2022.
//

import Foundation
import UIKit
import CoreData

protocol SearchViewModelProtocol: AnyObject {
    
    // MARK: - Properties

    var items: [TableCellViewModelProtocol] { get }
    var searchItems: [TableCellViewModelProtocol] { get }
    var searchText: String? { get set }
    var searchIsEmpty: Bool { get }
    
    // MARK: - Functions

    func saveItems()
    func filterContentForSearchText(_ searchText: String)
}

final class SearchViewModel: SearchViewModelProtocol {

    // MARK: - Properties

    var router: SearchRouterProtocol
    var items: [TableCellViewModelProtocol] = []
    var searchItems: [TableCellViewModelProtocol] = []
    var coreData: [Items] = []
    var searchText: String?
    
    var searchIsEmpty: Bool {
        guard let text = searchText else { return false }
        return text.isEmpty
    }
    
    // MARK: - Private properties
    
    var item: [SearchItemsViewModel] = []
    
    private var title: String?

    // MARK: - Private properties

    

    // MARK: - Constructor

    init(router: SearchRouterProtocol) {
        self.router = router

    }

    // MARK: - Functions
    
    func saveItems() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<Items> = Items.fetchRequest()
        
        do {
            coreData = try context.fetch(fetchRequest)
            self.item.removeAll()
            self.items.removeAll()
            fetch()
            item.append(contentsOf: coreData.compactMap { SearchItemsViewModel(image: UIImage(data: $0.image!)!, title: $0.title ?? "", value: $0.value ?? "" , location: $0.location ?? "", sum: Int($0.sum), textName: $0.textName ?? "", textPhone: $0.textPhone ?? "", textMail: $0.textMail ?? "", router: router) })

            item.reverse()
            self.items.insert(contentsOf: item, at: 0)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func filterContentForSearchText(_ searchText: String) {
        searchItems = item.filter({ (item: SearchItemsViewModel) in
            return item.title.lowercased().contains(searchText.lowercased())
        })
    }

    // MARK: - Private functions
    
    private func fetch() {
        item.append(SearchItemsViewModel(image: #imageLiteral(resourceName: "sad"), title: "Вспахать огород 6", value: "Нужно вспахать огород, земля 5 соток, все инструменты имеются.", location: "Назрань", sum: 4000, textName: "Дурак Никита", textPhone: "+7(928)232-36-89", textMail: "digital@mail.ru", router: router))
    }
    
    func didTapAddButton() {
    }
}
