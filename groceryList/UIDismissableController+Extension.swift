//
//  UIDismissableController+Extension.swift
//  groceryList
//
//  Created by Profit, Holden on 1/23/17.
//  Copyright © 2017 Profit, Holden. All rights reserved.
//

import Foundation
import UIKit

protocol Dismissable {
    func dismissView()
}

open class UIDismissableController: UIViewController, Dismissable {
    @IBAction func dismissView() {
        dismiss(animated: UIView.areAnimationsEnabled, completion: nil)
    }
}
