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
    
    // MARK: - Functions

    func saveItems()
    func fetch()
}

final class SearchViewModel: SearchViewModelProtocol {

    // MARK: - Constants


    // MARK: - Properties

    var router: SearchRouterProtocol
    var items: [TableCellViewModelProtocol] = []
    var coreData: [Items] = []
    
    // MARK: - Private properties
    
    private var title: String?

    // MARK: - Private properties

    

    // MARK: - Constructor

    init(router: SearchRouterProtocol) {
        self.router = router
        
        //var items = [TableCellViewModelProtocol]()
//        items.append(SearchItemsViewModel(image: #imageLiteral(resourceName: "sad"), title: "Вспахать огород 6", value: "Нужно вспахать огород, земля 5 соток, все инструменты имеются.", location: "Назрань", sum: 4000, textName: "Дурак Никита", textPhone: "+7(928)232-36-89", textMail: "digital@mail.ru", router: router))
//        items.append(SearchItemsViewModel(image: #imageLiteral(resourceName: "sad"), title: "Вспахать огород 6", value: "Нужно вспахать огород, земля 5 соток, все инструменты имеются.", location: "Назрань", sum: 4000, textName: "Дурак Никита", textPhone: "+7(928)232-36-89", textMail: "digital@mail.ru", router: router))
        
//        let item = items.compactMap { SearchItemsViewModel(image: UIImage(data: $0.image!)!, title: $0.title ?? "", value: $0.value ?? "", location: $0.location ?? "", sum: Int($0.sum), textName: $0.textName ?? "", textPhone: $0.textPhone ?? "", textMail: $0.textMail ?? "", router: router) }
//
//        sections.append(SectionItemsViewModel(items: item))
        saveItems()
    }

    // MARK: - Functions
    
    func saveItems(image: UIImage, title: String, value: String, location: String, sum: Int, textName: String, textPhone: String, textMail: String) {
        
    }
    
    func saveItems() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<Items> = Items.fetchRequest()
        
        do {
            coreData = try context.fetch(fetchRequest)
            self.items.removeAll()
            var item = coreData.compactMap { SearchItemsViewModel(image: UIImage(data: $0.image!)!, title: $0.title ?? "", value: $0.value ?? "" , location: $0.location ?? "", sum: Int($0.sum), textName: $0.textName ?? "", textPhone: $0.textPhone ?? "", textMail: $0.textMail ?? "", router: router) }

            //sections.insert(SectionItemsViewModel(items: item), at: 0)
            item.reverse()
            self.items.insert(contentsOf: item, at: 0)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
//        let item = items.compactMap { SearchItemsViewModel(image: UIImage(data: $0.image!)!, title: $0.title ?? "", value: $0.value ?? "", location: $0.location ?? "", sum: Int($0.sum), textName: $0.textName ?? "", textPhone: $0.textPhone ?? "", textMail: $0.textMail ?? "", router: router) }

    }

    func fetch() {
        items.append(contentsOf: allItems)
    }

    // MARK: - Private functions
    
    func didTapAddButton() {
    }
}
