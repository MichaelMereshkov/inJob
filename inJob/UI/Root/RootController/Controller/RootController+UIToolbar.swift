//
//  RootController+UIToolbar.swift
//  inJob
//
//  Created by Михаил Мерешковв on 04.12.2023.
//

import UIKit

enum NavigationBar: Int {
    case search = 0
    case favorites
    case add
    case responses
    case profile

    var name: String {
        switch self {
        case .search:
            return "Поиск"
        case .favorites:
            return "Избранные"
        case .add:
            return "Добавить"
        case .responses:
            return "Отклики"
        case .profile:
            return "Профиль"
        }
    }

    var image: String {
        switch self {
        case .search:
            return "magnifyingglass"
        case .favorites:
            return "suit.heart.fill"
        case .add:
            return "plus"
        case .responses:
            return "envelope.fill"
        case .profile:
            return "person.crop.circle"
        }
    }
}
