//
//  Array+Extension.swift
//  groceryList
//
//  Created by Profit, Holden on 11/27/16.
//  Copyright © 2016 Profit, Holden. All rights reserved.
//

import Foundation

extension Array {
    func value(at index: Int) -> Element? {
        guard index >= 0 && index < endIndex else {
            return nil
        }
        return self[index]
    }
}

