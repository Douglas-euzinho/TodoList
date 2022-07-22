//
//  Food+CoreDataProperties.swift
//  TodoList
//
//  Created by Douglas Figueirôa on 22/07/22.
//
//

import Foundation
import CoreData


extension Food {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Food> {
        return NSFetchRequest<Food>(entityName: "Food")
    }

    @NSManaged public var name: String?
    @NSManaged public var type: String?

}

extension Food : Identifiable {

}
