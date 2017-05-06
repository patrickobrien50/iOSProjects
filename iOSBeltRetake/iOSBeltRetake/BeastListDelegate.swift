//
//  BeastListDelegate.swift
//  iOSBeltRetake
//
//  Created by Patrick O'Brien on 4/26/17.
//  Copyright © 2017 Patrick O'Brien. All rights reserved.
//

import Foundation
import UIKit

protocol BeastListDelegate: class {
    func cancelButtonPressed(controller: JustBeastItTableViewController)
    func justBeastIt(controller: JustBeastItTableViewController, didFinishAddingBeastTask task: String, date: Date, beasted: Bool)
    func editBeast(controller: JustBeastItTableViewController, didFinishEditingBeastTask task: String, date: Date, beasted: Bool)
}
