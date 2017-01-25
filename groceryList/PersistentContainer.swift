//
//  PersistentContainer.swift
//  groceryList
//
//  Created by Profit, Holden on 1/23/17.
//  Copyright © 2017 Profit, Holden. All rights reserved.
//

import Foundation
import CoreData

protocol PersistentContainer {
    var persistentContainer: NSPersistentContainer { get set }
    var managedObjectContext: NSManagedObjectContext { get }
}

extension PersistentContainer {
    var managedObjectContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
}
