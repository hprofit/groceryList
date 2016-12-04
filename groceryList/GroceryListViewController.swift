//
//  GroceryListViewController.swift
//  groceryList
//
//  Created by Profit, Holden on 11/28/16.
//  Copyright © 2016 Profit, Holden. All rights reserved.
//

import UIKit

class GroceryListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var dataTableView: UITableView?
    @IBOutlet var navBarView: UINavigationItem?
    
    let manager = DataManager.shared
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        manager.loadGroceryItemData()
        navBarView?.title = manager.getGroceryListName(from: manager.selectedGroceryListIndex)
        dataTableView?.reloadData()
    }
    
    // MARK: - Table View
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manager.groceryListCount
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let item = manager.getGroceryItem(from: indexPath)
        cell.textLabel?.text = item?.name
        cell.detailTextLabel?.text = "Quantity: \(item?.quantity ?? 0)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: UIView.areAnimationsEnabled)
        
        manager.selectedGroceryItemIndex = indexPath.row
    }
}
