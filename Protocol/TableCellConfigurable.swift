//
//  TableCellConfigurable.swift
//  inJob
//
//  Created by Михаил Мерешков on 05.11.2022.
//

import Foundation

public protocol TableCellConfigurable: AnyObject {

    // MARK: - Functions

    func setup(viewModel: TableCellViewModelProtocol)
}
