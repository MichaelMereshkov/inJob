//
//  UITableView+Extension.swift
//  inJob
//
//  Created by Михаил Мерешков on 05.11.2022.
//

import UIKit

public extension UITableView {

    // MARK: - Functions

    func register<T: UITableViewCell>(_ type: T.Type) {
        register(type, forCellReuseIdentifier: type.cellId)
    }
}
