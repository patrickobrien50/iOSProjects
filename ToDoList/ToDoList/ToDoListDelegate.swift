//
//  ToDoListDelegate.swift
//  ToDoList
//
//  Created by Patrick O'Brien on 3/20/17.
//  Copyright © 2017 Patrick O'Brien. All rights reserved.
//

import UIKit

protocol ToDoListDelegate: class {
    func itemSaved(by controller: AddItemViewController, with text: [String], with date: NSDate, for indexPath: NSIndexPath?)
}
