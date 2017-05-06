//
//  AddEventViewController.swift
//  Event Tracker
//
//  Created by Patrick O'Brien on 3/24/17.
//  Copyright © 2017 Patrick O'Brien. All rights reserved.
//

import UIKit

class AddEventViewController: UIViewController {
    
    weak var delegate: AddEventViewControllerDelegate?
    
    var item: NewEventItem?
    
    var indexPath: NSIndexPath?

    @IBOutlet weak var eventTitleTextField: UITextField!
    @IBOutlet weak var eventInfoTextView: UITextView!
    @IBOutlet weak var eventTimePicker: UIDatePicker!
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        let time = eventTimePicker.date
        var item = [String]()
        item.append(eventTitleTextField.text!)
        item.append(eventInfoTextView.text!)
        delegate?.itemSaved(by: self, with: item, at: time as NSDate, for: indexPath)
        print("Save button Pressed")
    }

    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        delegate?.cancelButtonPressed(by: self)
        print("Cancel Button Pressed")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        eventInfoTextView.text = item?.eventInfo
        eventTitleTextField.text = item?.eventTitle
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
