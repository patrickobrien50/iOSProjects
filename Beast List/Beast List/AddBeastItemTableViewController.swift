//
//  AddBeastItemTableViewController.swift
//  Beast List
//
//  Created by Patrick O'Brien on 3/22/17.
//  Copyright © 2017 Patrick O'Brien. All rights reserved.
//

import UIKit

class AddBeastItemTableViewController: UITableViewController {
    
    
    weak var delegate: AddBeastItemTableViewDelegate?
    
    var indexPath: NSIndexPath?
    
    var beastListItem: BeastListItem?
    
    @IBOutlet weak var beastListItemTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beastListItemTextField.text = beastListItem?.text
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        let itemName = beastListItemTextField.text!
        delegate?.itemSaved(by: self, with: itemName, for: indexPath)
        
        
    }

    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        delegate?.cancelButtonPressed(by: self)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
