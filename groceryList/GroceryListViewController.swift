//
//  GroceryListViewController.swift
//  groceryList
//
//  Created by Profit, Holden on 11/28/16.
//  Copyright © 2016 Profit, Holden. All rights reserved.
//

import UIKit

class GroceryListViewController: UIEditableTableController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var navBarView: UINavigationItem?
    
    var manager = DataManager.shared
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        manager.loadGroceryItemData()
        navBarView?.title = manager.getGroceryListName(from: manager.selectedListIndex)
        tableView?.reloadData()
    }
    
    // MARK: - Table View
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manager.currentListCount
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let item = manager.getGroceryItem(from: indexPath)
        cell.textLabel?.text = item?.name
        cell.detailTextLabel?.text = "Quantity: \(item?.quantity ?? 0)"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath);
    }
    
    // Clicked Row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: UIView.areAnimationsEnabled)
        manager.selectedItemIndex = indexPath.row
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            deleteRow(at: indexPath)
        }
    }
    
    func deleteRow(at indexPath: IndexPath) {
        try? manager.delete(groceryItemIndex: indexPath.row)
        tableView?.reloadData()
    }
}
