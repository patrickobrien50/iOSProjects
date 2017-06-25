//
//  Instructions+CoreDataProperties.swift
//  Recipe to Remember
//
//  Created by Patrick O'Brien on 6/23/17.
//  Copyright © 2017 Patrick O'Brien. All rights reserved.
//

import Foundation
import CoreData


extension Instructions {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Instructions> {
        return NSFetchRequest<Instructions>(entityName: "Instructions")
    }

    @NSManaged public var details: String?

}
