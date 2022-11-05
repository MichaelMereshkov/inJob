//
//  SearchItemsViewModel.swift
//  inJob
//
//  Created by Михаил Мерешков on 05.11.2022.
//

import Foundation
import UIKit

protocol SearchItemsViewModelProtocol: AnyObject {
    
    // MARK: - Properties
    
    var image: UIImage { get }
    var title: String { get }
    var value: String { get }
    var location: String { get } 
    var sum: Int { get }
    
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

    // MARK: - Constructor

    init(image: UIImage, title: String, value: String, location: String, sum: Int) {
        self.image = image
        self.title = title
        self.value = value
        self.location = location
        self.sum = sum
    }
}

