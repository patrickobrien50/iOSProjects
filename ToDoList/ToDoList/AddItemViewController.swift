//
//  AddItemViewController.swift
//  ToDoList
//
//  Created by Patrick O'Brien on 3/20/17.
//  Copyright © 2017 Patrick O'Brien. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {
    
    weak var delegate: ToDoListDelegate?
    
    var indexPath: NSIndexPath?

    @IBOutlet weak var itemTitleTextField: UITextField!
    @IBOutlet weak var itemDetailsTextField: UITextField!
    @IBOutlet weak var itemDatePicker: UIDatePicker!
    
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        delegate?.itemSaved(by: self, with: [itemTitleTextField.text!, itemDetailsTextField.text!], with: itemDatePicker.date as NSDate, for: indexPath)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
