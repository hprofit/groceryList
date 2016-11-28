//
//  DataManager.swift
//  groceryList
//
//  Created by Profit, Holden on 11/27/16.
//  Copyright © 2016 Profit, Holden. All rights reserved.
//
import CoreData

enum DataError: Error {
    case BadManagedObjectContext(String)
    case BadEntity(String)
}

class DataManager {
    static var shared: DataManager = DataManager()
    
    var managedObjectContext: NSManagedObjectContext?
    
    var allGroceryLists: [GroceryList]
    var allGroceryListCount: Int {
        return allGroceryLists.count
    }
    
    var groceryList: [GroceryItem]
    var groceryListCount: Int {
        return groceryList.count
    }
    
    var selectedGroceryListIndex: Int
    var selectedGroceryItemIndex: Int
    
    private init() {
        allGroceryLists = []
        groceryList = []
        selectedGroceryListIndex = -1
        selectedGroceryItemIndex = -1
    }
}

extension DataManager {
    func loadGroceryListData() {
        allGroceryLists = fetch()
    }
    
    func create(groceryListNamed name: String?) throws {
        guard let ctx = managedObjectContext else {
            throw DataError.BadManagedObjectContext("The managed object context was nil")
        }
        guard let entity = NSEntityDescription.entity(forEntityName: "GroceryList", in: ctx) else {
            throw DataError.BadEntity("The entity description was bad")
        }
        let obj = GroceryList(entity: entity, insertInto: ctx)
        obj.name = name
        
        try? save()
    }
    
    func getGroceryListName(from indexPath: IndexPath) -> String? {
        return allGroceryLists.value(at: indexPath.row)?.name
    }
}

extension DataManager {
    // MARK: - Get / Create New GroceryItem
    func loadGroceryItemData() {
        let selectedGroceryList = allGroceryLists.value(at: selectedGroceryListIndex)
        groceryList = selectedGroceryList?.groceries?.flatMap { item in
            return item as? GroceryItem
            } ?? []
    }
    
    func create(data: (name: String?, quantity: Int)) throws {
        guard let ctx = managedObjectContext else {
            throw DataError.BadManagedObjectContext("The managed object context was nil")
        }
        guard let entity = NSEntityDescription.entity(forEntityName: "MyData", in: ctx) else {
            throw DataError.BadEntity("The entity description was bad")
        }
        let obj = GroceryItem(entity: entity, insertInto: ctx)
        obj.name = data.name
        obj.quantity = Int16(data.quantity)
        obj.groceryList = allGroceryLists.value(at: selectedGroceryListIndex)
        
        try? save()
    }
    
    func getGroceryItem(from indexPath: IndexPath) -> (name: String?, quantity: Int)? {
        guard let item = groceryList.value(at: indexPath.row) else {
            return nil
        }
        return (item.name, Int(item.quantity))
    }
    
    func getSelectedGroceryItem() -> (name: String?, quantity: Int)? {
        guard let item = groceryList.value(at: selectedGroceryItemIndex) else {
            return nil
        }
        return (item.name, Int(item.quantity))
    }
}

extension DataManager {
    // MARK: - Fetching Data
    
    func fetch<T: NSManagedObject>() -> [T] {
        var result: [T]? = nil
        managedObjectContext?.performAndWait { [weak self] in
            do {
                result = try self?.executeFetchRequest()
            }
            catch {
                print(error)
            }
        }
        return result ?? []
    }
    
    private func executeFetchRequest<T: NSManagedObject>() throws -> [T]? {
        let request = T.fetchRequest()
        return try request.execute() as? [T]
    }
    
    func save() throws {
        try managedObjectContext?.save()
    }
}
