//
//  UIButton+Extension.swift
//  inJob
//
//  Created by Михаил Мерешков on 05.11.2022.
//

import UIKit

public extension UIButton {
    
    // MARK: - Functions

    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        let rect = CGRect(origin: .zero, size: CGSize(width: 1.0, height: 1.0))
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        setBackgroundImage(image, for: state)
    }
}
