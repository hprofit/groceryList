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
    
    var data: [GroceryItem]
    
    private init() {
        data = []
    }
    
    func set(managedObjectContext: NSManagedObjectContext) {
        self.managedObjectContext = managedObjectContext
    }
    
    func createGroceryItem(data: (name: String?, quantity: Int)) throws {
        guard let ctx = managedObjectContext else {
            throw DataError.BadManagedObjectContext("The managed object context was nil")
        }
        guard let entity = NSEntityDescription.entity(forEntityName: "MyData", in: ctx) else {
            throw DataError.BadEntity("The entity description was bad")
        }
        let obj = GroceryItem(entity: entity, insertInto: ctx)
        obj.name = data.name
        obj.quantity = Int16(data.quantity)
        
        try? save()
    }
    
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
