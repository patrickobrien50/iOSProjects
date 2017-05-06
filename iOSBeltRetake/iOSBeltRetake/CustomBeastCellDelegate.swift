//
//  CustomBeastCellDelegate.swift
//  iOSBeltRetake
//
//  Created by Patrick O'Brien on 4/26/17.
//  Copyright © 2017 Patrick O'Brien. All rights reserved.
//

import Foundation
import UIKit

protocol CustomBeastCellDelegate: class {
    func didSelectButtonAtIndexPathOfCell(sender: CustomBeastCell)
}
