//
//  SectionViewModelProtocol.swift
//  inJob
//
//  Created by Михаил Мерешков on 05.11.2022.
//

import Foundation
import UIKit

protocol SectionViewModelProtocol {

    // MARK: - Properties

    var headerTitle: String? { get }
    var items: [TableCellViewModelProtocol] { get }
}
