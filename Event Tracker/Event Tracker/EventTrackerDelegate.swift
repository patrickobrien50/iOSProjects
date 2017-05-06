//
//  EventTrackerDelegate.swift
//  Event Tracker
//
//  Created by Patrick O'Brien on 3/24/17.
//  Copyright © 2017 Patrick O'Brien. All rights reserved.
//

import UIKit

protocol AddEventViewControllerDelegate: class {
    func itemSaved( by controller: AddEventViewController, with text: [String], at time: NSDate, for indexPath: NSIndexPath?)
    func cancelButtonPressed(by controller: AddEventViewController)
}
