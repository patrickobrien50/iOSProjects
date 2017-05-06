//
//  File.swift
//  iOS Belt Exam
//
//  Created by Patrick O'Brien on 3/17/17.
//  Copyright © 2017 Patrick O'Brien. All rights reserved.
//

import Foundation
import UIKit

protocol ContactInfoViewControllerDelegate: class {
    func itemSaved(by controller: ContactInfoViewController, with text: [String?], at indexPath: NSIndexPath?)
    func cancelButtonPressed(by controller: ContactInfoViewController)
}
