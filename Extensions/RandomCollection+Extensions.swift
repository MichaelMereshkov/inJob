//
//  RandomCollection+Extensions.swift
//  inJob
//
//  Created by Михаил Мерешков on 05.11.2022.
//

import Foundation

public extension RandomAccessCollection {

    // MARK: - Functions

    func element(at index: Index) -> Element? {
        guard indices.contains(index) else {
            return nil
        }

        return self[index]
    }
}
