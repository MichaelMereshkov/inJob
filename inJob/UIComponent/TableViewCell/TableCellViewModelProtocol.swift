//
//  TableCellViewModelProtocol.swift
//  inJob
//
//  Created by Михаил Мерешков on 05.11.2022.
//

import Foundation

public protocol TableCellViewModelProtocol: AnyObject {

    // MARK: - Properties

    var cellId: String { get }

    // MARK: - Methods

    func didTapButton()
}

public extension TableCellViewModelProtocol {

    func didTapButton() {}
}
