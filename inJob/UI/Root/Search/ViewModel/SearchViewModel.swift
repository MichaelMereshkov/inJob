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
    
    // MARK: - Private properties
    
    var item: [SearchItemsViewModel] = []

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
            item.append(contentsOf: coreData.compactMap { SearchItemsViewModel(image: UIImage(data: $0.image!)!, title: $0.title ?? "", value: $0.value ?? "" , location: $0.location ?? "", sum: Int($0.sum), textName: $0.textName ?? "", textPhone: $0.textPhone ?? "", textMail: $0.textMail ?? "", isLaik: false, isFavorite: false, router: router) })

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
        item.append(SearchItemsViewModel(image: #imageLiteral(resourceName: "sad"), title: "Вспахать огород", value: "Нужно вспахать огород, земля 10 соток, все инструменты имеются.", location: "Назрань", sum: 10000, textName: "Василий Петров", textPhone: "+7(928)***-54-89", textMail: "inJob@inJob.ru", isLaik: false, isFavorite: true, router: router))
        
        item.append(SearchItemsViewModel(image: #imageLiteral(resourceName: "log6"), title: "Выкопать яму", value: "Нужно выкопать яму глубиною 7м.", location: "Долаково", sum: 12000, textName: "Сергей Левин", textPhone: "+7(928)***-67-32", textMail: "inJob@inJob.ru", isLaik: false, isFavorite: false, router: router))
        
        item.append(SearchItemsViewModel(image: #imageLiteral(resourceName: "log9"), title: "Починить кран", value: "Ищу сантихника, нужно починить кран.", location: "Назрань", sum: 1500, textName: "Михаил Коваль", textPhone: "+7(928)***-64-94", textMail: "inJob@inJob.ru", isLaik: false, isFavorite: true, router: router))
        
        item.append(SearchItemsViewModel(image: #imageLiteral(resourceName: "log7"), title: "Уборка территории", value: "Нужны люди для уборки территории разбером 50 соток, сумма указана за дневной оклад.", location: "Магас", sum: 2000, textName: "Андрей Волков", textPhone: "+7(928)***-44-11", textMail: "inJob@inJob.ru", isLaik: true, isFavorite: false, router: router))
        
        item.append(SearchItemsViewModel(image: #imageLiteral(resourceName: "log2"), title: "Скосить траву", value: "Скосить траву на земельном участке 12 соток.", location: "Майское", sum: 4000, textName: "Олег Звягин", textPhone: "+7(928)***-85-64", textMail: "inJob@inJob.ru", isLaik: false, isFavorite: false, router: router))
        
        item.append(SearchItemsViewModel(image: #imageLiteral(resourceName: "log5"), title: "Кладка", value: "Нужен хороший мастер по кладке, дом 10х10.", location: "Назрань", sum: 100000, textName: "Даниел Корнаев", textPhone: "+7(928)***-21-14", textMail: "inJob@inJob.ru", isLaik: true, isFavorite: false, router: router))
        
        item.append(SearchItemsViewModel(image: #imageLiteral(resourceName: "log3"), title: "Положить крашу", value: "Нужен специалист по укладке крыши, дом 15х12.", location: "Сурхахи", sum: 300000, textName: "Али Понамарев", textPhone: "+7(928)***-51-77", textMail: "inJob@inJob.ru", isLaik: false, isFavorite: false, router: router))
        
        item.append(SearchItemsViewModel(image: #imageLiteral(resourceName: "log4"), title: "Проложить отопление", value: "Ищу специалиста который проложит отопление в новом доме, квадратура 300кв.", location: "Плиево", sum: 150000, textName: "Руслан Исаков", textPhone: "+7(928)***-11-33", textMail: "inJob@inJob.ru", isLaik: true, isFavorite: false, router: router))
        
        item.append(SearchItemsViewModel(image: #imageLiteral(resourceName: "log1"), title: "Собрать кухонную мебель", value: "Ищу специалиста который быстро соберет кухонную мебель, собрать нужно без царапин и сколов.", location: "Сунжа", sum: 150000, textName: "Дмитрий Резняк", textPhone: "+7(928)***-02-61", textMail: "inJob@inJob.ru", isLaik: false, isFavorite: true, router: router))
        
        item.append(SearchItemsViewModel(image: #imageLiteral(resourceName: "log8"), title: "Требуется младший IT специалист", value: "Требуется младший специалист на работу в Министерство промышленности и цифрового развития Республики Ингушетия.", location: "Назрань", sum: 30000, textName: "Отдел кадров", textPhone: "+7(928)***-06-06", textMail: "inJob@inJob.ru", isLaik: false, isFavorite: false, router: router))
    }
}
