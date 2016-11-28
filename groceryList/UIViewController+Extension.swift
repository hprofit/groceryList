//
//  UIViewController+Extension.swift
//  groceryList
//
//  Created by Profit, Holden on 11/27/16.
//  Copyright © 2016 Profit, Holden. All rights reserved.
//

import UIKit

extension UIViewController {
    @IBAction func dimissKeyboard() {
        view.endEditing(true)
    }
}
