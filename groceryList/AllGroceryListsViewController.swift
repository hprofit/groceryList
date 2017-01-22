//
//  MainViewController.swift
//  groceryList
//
//  Created by Profit, Holden on 11/27/16.
//  Copyright © 2016 Profit, Holden. All rights reserved.
//

import UIKit

class AllGroceryListsViewController: UIEditableTableController, UITableViewDataSource, UITableViewDelegate {
    var manager = DataManager.shared
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        manager.loadGroceryListData()
        tableView?.reloadData()
    }
    
    // MARK: - Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manager.allGroceryListCount
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.textLabel?.text = manager.getGroceryListName(from: indexPath)
        cell.detailTextLabel?.text = "Items: \(manager.getGroceryListCount(from: indexPath) ?? 0)"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath);
    }
    
    // Clicked Row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: UIView.areAnimationsEnabled)
        manager.selectedListIndex = indexPath.row
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
        let listToDelete: GroceryList? = manager.getGroceryList(from: indexPath)
        try? manager.delete(groceryList: listToDelete)
        tableView?.reloadData()
    }
}

