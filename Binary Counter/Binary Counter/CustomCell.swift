//
//  CustomCell.swift
//  Binary Counter
//
//  Created by Patrick O'Brien on 3/19/17.
//  Copyright © 2017 Patrick O'Brien. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var binaryLabel: UILabel!
    
    
    
    @IBAction func minusButton(_ sender: UIButton) {
        if binaryLabel.text == "" {
            print("No number")
        }
        else if binaryLabel.text == "1" {
            binaryLabel.text = ""
            print(binaryLabel.text!)
        }
        else {
            var powerOfTen = Int(binaryLabel.text!)
            powerOfTen = powerOfTen! / 10
            binaryLabel.text = String(powerOfTen!)
            print(binaryLabel.text!)
        }
        
    }
    
    
    
    @IBAction func plusButton(_ sender: UIButton) {
        if binaryLabel.text == "" {
            binaryLabel.text = "1"
            print(binaryLabel.text!)
        }
        else if binaryLabel.text == "1000000000000000000"{
            print("Reached Max!!!!!")
        }
        else {
            var powerOfTen = Int(binaryLabel.text!)
            powerOfTen = powerOfTen! * 10
            binaryLabel.text = String(powerOfTen!)
            print(binaryLabel.text!)
        }
    }
}
