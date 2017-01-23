//
//  AddGroceryListViewController.swift
//  groceryList
//
//  Created by Profit, Holden on 11/28/16.
//  Copyright © 2016 Profit, Holden. All rights reserved.
//

import UIKit

class AddGroceryListViewController: UIDismissableController {
    
    @IBOutlet var nameField: UITextField?
    
    var manager = DataManager.shared
    
    @IBAction func add() {
        try? manager.create(groceryListNamed: nameField?.text)
        dismissView()
    }
}
