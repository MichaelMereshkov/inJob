//
//  NewAdPhotoItemModelCell.swift
//  inJob
//
//  Created by Михаил Мерешковв on 22.12.2023.
//

import Foundation

public protocol NewAdPhotoItemModelCellProtocol: AnyObject {
    
    // MARK: - Properties
    
    var image: UIImage { get }
    var title: String { get }
    var value: String { get }
    
}

final class NewAdPhotoItemModelCell: NewAdPhotoItemModelCellProtocol {

    // MARK: - Properties

    var headerTitle: String? {
        return nil
    }

    var items = [TableCellViewModelProtocol]()

    // MARK: - Constructor

    init(items: [TableCellViewModelProtocol]) {
        self.items = items
    }

    // MARK: - Destructor

    deinit {
        items.removeAll()
    }
}
