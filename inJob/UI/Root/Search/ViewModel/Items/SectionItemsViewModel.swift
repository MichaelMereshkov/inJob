//
//  SectionItemsViewModel.swift
//  inJob
//
//  Created by Михаил Мерешков on 05.11.2022.
//

import Foundation

final class SectionItemsViewModel: SectionViewModelProtocol {

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
