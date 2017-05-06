//
//  NewNoteDelegate.swift
//  Notes CLone
//
//  Created by Patrick O'Brien on 3/21/17.
//  Copyright © 2017 Patrick O'Brien. All rights reserved.
//

import UIKit

protocol NewNoteDelegate: class {
    func itemSaved(by controller: NewNoteViewController, with text: String, with date: String, for indexPath: NSIndexPath?)
}
