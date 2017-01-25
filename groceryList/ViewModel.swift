//
//  ViewModel.swift
//  groceryList
//
//  Created by Profit, Holden on 1/23/17.
//  Copyright © 2017 Profit, Holden. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ViewModel {
    
    var persistentContainer: PersistentContainer?
    var managedObjectContext: NSManagedObjectContext? {
        return persistentContainer?.managedObjectContext
    }
    
    init(persistentContainer: PersistentContainer? = UIApplication.shared.delegate as? AppDelegate) {
        self.persistentContainer = persistentContainer
    }
    
    
    func save() throws {
        try managedObjectContext?.save()
    }
    
    func executeRequest<Type: NSManagedObject> () throws -> [Type]? {
        let request = Type.fetchRequest()
        return try request.execute() as? [Type]
    }
    
    func fetch<Type: NSManagedObject>() -> [Type] {
        var result: [Type]? = nil
        managedObjectContext?.performAndWait { [weak self] in
            do {
                result = try self?.executeRequest()
            }
            catch {
                print(error)
            }
        }
        return result ?? []
    }
}
