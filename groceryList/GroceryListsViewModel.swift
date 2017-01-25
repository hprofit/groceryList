//
//  GroceryListsViewModel.swift
//  groceryList
//
//  Created by Profit, Holden on 1/23/17.
//  Copyright © 2017 Profit, Holden. All rights reserved.
//

import Foundation


//class GroceryListsViewModel: ViewModel {
//    
//    var groceryLists: [GroceryList] {
//        return fetch() ?? []
//    }
//    
//    func groceryList(at indexPath: IndexPath) -> (name: String?, itemCount: Int) {
//        let list: GroceryList? = groceryLists.value(at: indexPath.row)
//        return (list?.name, list?.groceries?.count ?? 0)
//    }
//    
//    func transferGroceryList(at indexPath: IndexPath, to container: inout SelectedGroceryListContainer) {
//        container.selectedGroceryList = groceryLists.value(at: indexPath.row)
//    }
//    
//    func createGroceryList(with name: String?) throws {
//        guard name?.isEmpty == false,
//            let newList: GroceryList = GroceryList(managedObjectContext: managedObjectContext) else {
//                
//        }
//    }
//}
