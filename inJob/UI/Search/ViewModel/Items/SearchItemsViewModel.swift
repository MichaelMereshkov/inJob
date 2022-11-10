//
//  SearchItemsViewModel.swift
//  inJob
//
//  Created by Михаил Мерешков on 05.11.2022.
//

import Foundation
import UIKit
import CoreData

public protocol SearchItemsViewModelProtocol: AnyObject {
    
    // MARK: - Properties
    
    var image: UIImage { get }
    var title: String { get }
    var value: String { get }
    var location: String { get } 
    var sum: Int { get }
    var textName: String { get }
    var textPhone: String { get }
    var textMail: String { get }
    var router: SearchRouterProtocol? { get }
    
}
final class SearchItemsViewModel: SearchItemsViewModelProtocol, TableCellViewModelProtocol {


    // MARK: - Properties

    var cellId: String {
        return SearchViewCell.cellId
    }

    var image: UIImage
    var title: String
    var value: String
    var location: String
    var sum: Int
    var textName: String
    var textPhone: String
    var textMail: String
    var router: SearchRouterProtocol?

    // MARK: - Constructor

    init(image: UIImage, title: String, value: String, location: String, sum: Int, textName: String, textPhone: String, textMail: String, router: SearchRouterProtocol?) {
        self.image = image
        self.title = title
        self.value = value
        self.location = location
        self.sum = sum
        self.textName = textName
        self.textPhone = textPhone
        self.textMail = textMail
        self.router = router
    }
}

