//
//  UIView+Extensions.swift
//  inJob
//
//  Created by Михаил Мерешков on 05.11.2022.
//

import UIKit

public extension UIView {

    // MARK: - Properties

    class var cellId: String {
        return (NSStringFromClass(self) as NSString).pathExtension
    }
}


