//
//  AddBeastItemTableViewDelegate.swift
//  Beast List
//
//  Created by Patrick O'Brien on 3/22/17.
//  Copyright © 2017 Patrick O'Brien. All rights reserved.
//

import UIKit

protocol AddBeastItemTableViewDelegate: class {
    func itemSaved(by controller: AddBeastItemTableViewController, with text: String, for indexPath: NSIndexPath?)
    func cancelButtonPressed(by controller: AddBeastItemTableViewController)
}
