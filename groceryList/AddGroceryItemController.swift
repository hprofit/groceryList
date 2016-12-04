//
//  AddGroceryItemController.swift
//  groceryList
//
//  Created by Profit, Holden on 11/28/16.
//  Copyright © 2016 Profit, Holden. All rights reserved.
//

import UIKit

class AddGroceryItemViewController: UIViewController {
    
    @IBOutlet var nameField: UITextField?
    @IBOutlet var quantityField: UITextField?
    
    var manager = DataManager.shared
    
    func dismissView() {
        dismiss(animated: UIView.areAnimationsEnabled, completion: nil)
    }
    
    lazy var alertCtrl: UIAlertController = {
        let alert = UIAlertController(title: "Error", message: "Please enter a valid quantity and name!", preferredStyle: .alert)
        alert.addAction( UIAlertAction(title: "OK", style: .cancel, handler: nil) )
        return alert
    }()
    
    private func showErrorAlert() {
        present(alertCtrl, animated: UIView.areAnimationsEnabled, completion: nil)
    }
    
    @IBAction func add() {
        guard let quantity = quantityField?.text?.integer, let name = nameField?.text else {
            showErrorAlert()
            return
        }
        try? manager.create(data: (name: name, quantity: quantity))
        dismissView()
    }
    
    @IBAction func dismiss() {
        dismissView()
    }
}
