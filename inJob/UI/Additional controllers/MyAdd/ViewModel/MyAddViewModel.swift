//
//  MyAddViewModel.swift
//  inJob
//
//  Created by Михаил Мерешков on 10.11.2022.
//

import Foundation
import UIKit
import CoreData

protocol MyAddViewModelProtocol: AnyObject {
    
    // MARK: - Properties

    var items: [TableCellViewModelProtocol] { get }
    
    // MARK: - Functions
    
    func saveItems()
    func didTapAddButton()
}

final class MyAddViewModel: MyAddViewModelProtocol {

    // MARK: - Properties

    var router: SearchRouterProtocol
    var items: [TableCellViewModelProtocol] = []
    
    // MARK: - Private properties
    
    private var coreData: [Items] = []

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
            self.items.removeAll()
            //fetch()
            var item = coreData.compactMap { SearchItemsViewModel(image: UIImage(data: $0.image!)!, title: $0.title ?? "", value: $0.value ?? "" , location: $0.location ?? "", sum: Int($0.sum), textName: $0.textName ?? "", textPhone: $0.textPhone ?? "", textMail: $0.textMail ?? "", router: router) }

            //sections.insert(SectionItemsViewModel(items: item), at: 0)
            item.reverse()
            self.items.insert(contentsOf: item, at: 0)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }

    // MARK: - Private functions
    
    func didTapAddButton() {
        //router.dismiss()
    }
}
