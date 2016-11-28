//
//  GroceryList+CoreDataProperties.swift
//  groceryList
//
//  Created by Profit, Holden on 11/27/16.
//  Copyright © 2016 Profit, Holden. All rights reserved.
//

import Foundation
import CoreData


extension GroceryList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GroceryList> {
        return NSFetchRequest<GroceryList>(entityName: "GroceryList");
    }

    @NSManaged public var name: String?
    @NSManaged public var groceries: NSSet?

}


// MARK: Generated accessors for people
extension GroceryList {
    
    @objc(addGroceryItemObject:)
    @NSManaged public func addToGroceries(_ value: GroceryItem)
    
    @objc(removeGroceryItemObject:)
    @NSManaged public func removeFromGroceries(_ value: GroceryItem)
    
    @objc(addGroceries:)
    @NSManaged public func addToGroceries(_ values: NSSet)
    
    @objc(removeGroceries:)
    @NSManaged public func removeFromGroceries(_ values: NSSet)
    
}
