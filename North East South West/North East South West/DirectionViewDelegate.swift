//
//  DirectionViewDelegate.swift
//  North East South West
//
//  Created by Patrick O'Brien on 3/14/17.
//  Copyright © 2017 Patrick O'Brien. All rights reserved.
//

import UIKit

protocol DirectionViewDelegate: class  {
    func wentInDirection(by controller: DirectionButtonViewController, with text: String)
    func cancelButtonPressed(by controller: DirectionButtonViewController)
}



