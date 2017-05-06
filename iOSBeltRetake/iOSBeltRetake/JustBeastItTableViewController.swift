//
//  JustBeastItTableViewController.swift
//  iOSBeltRetake
//
//  Created by Patrick O'Brien on 4/26/17.
//  Copyright © 2017 Patrick O'Brien. All rights reserved.
//

import UIKit

class JustBeastItTableViewController: UITableViewController {
    
    weak var delegate: BeastListDelegate?
    var beast: BeastListItem?
    var indexPath: Int?
    var date = Date()
    var beasted = false
    
    @IBOutlet weak var newBeastTextField: UITextField!
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        delegate?.cancelButtonPressed(controller: self)
    }

    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        if let beast = beast {
            beast.task = newBeastTextField.text!
            delegate?.editBeast(controller: self, didFinishEditingBeastTask: beast.task!, date: date, beasted: beasted)
        } else {
            let task = newBeastTextField.text!
            delegate?.justBeastIt(controller: self, didFinishAddingBeastTask: task, date: date, beasted: beasted)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        newBeastTextField.text = beast?.task

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
