//
//  Ingredient+CoreDataProperties.swift
//  Recipe to Remember
//
//  Created by Patrick O'Brien on 6/23/17.
//  Copyright © 2017 Patrick O'Brien. All rights reserved.
//

import Foundation
import CoreData


extension Ingredient {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ingredient> {
        return NSFetchRequest<Ingredient>(entityName: "Ingredient")
    }

    @NSManaged public var name: String?
    @NSManaged public var amount: Int64
    @NSManaged public var measurement: String?

}
