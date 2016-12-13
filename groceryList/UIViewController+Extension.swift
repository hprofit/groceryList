//
//  UIViewController+Extension.swift
//  groceryList
//
//  Created by Profit, Holden on 11/27/16.
//  Copyright © 2016 Profit, Holden. All rights reserved.
//

import UIKit

protocol dismissableKeyboard {
    func dismissKeyboard()
}

extension UIViewController: dismissableKeyboard {
    @IBAction func dismissKeyboard() {
        view.endEditing(true)
    }
}

protocol CloseableController {
    func close()
}

extension UIViewController: CloseableController {
    @IBAction func close() {
        dismiss(animated: UIView.areAnimationsEnabled, completion: nil)
    }
}
