//
//  CustomBeastCell.swift
//  iOSBeltRetake
//
//  Created by Patrick O'Brien on 4/26/17.
//  Copyright © 2017 Patrick O'Brien. All rights reserved.
//

import Foundation
import UIKit

class CustomBeastCell: UITableViewCell {
    weak var cellDelegate: CustomBeastCellDelegate?
    
    @IBOutlet weak var beastButton: UIButton!
    @IBOutlet weak var taskLabel: UILabel!
    @IBAction func beastButtonPressed(_ sender: UIButton) {
        self.cellDelegate?.didSelectButtonAtIndexPathOfCell(sender: self)
    }
}
