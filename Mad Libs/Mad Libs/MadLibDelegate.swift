//
//  MadLibDelegate.swift
//  Mad Libs
//
//  Created by Patrick O'Brien on 3/13/17.
//  Copyright © 2017 Patrick O'Brien. All rights reserved.
//

import UIKit

protocol MadLibDelegate: class {
    func itemsSaved(by controller: WordsViewController, with text: [String])
}
