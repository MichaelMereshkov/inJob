//
//  AddItemsViewModel.swift
//  inJob
//
//  Created by Михаил Мерешков on 06.11.2022.
//

import UIKit

protocol AddItemsViewModelProtocol: AnyObject {
    
    // MARK: - Properties
    
    var title: String { get }
    var result: Int { get }
    var keyboardType: UIKeyboardType { get }
    
}
final class AddItemsViewModel: AddItemsViewModelProtocol, TableCellViewModelProtocol {


    // MARK: - Properties

    var cellId: String {
        return AddViewCell.cellId
    }

    var title: String
    var result: Int
    var keyboardType: UIKeyboardType

    // MARK: - Constructor

    init(title: String, result: Int, keyboardType: UIKeyboardType) {
        self.title = title
        self.result = result
        self.keyboardType = keyboardType
    }
}
