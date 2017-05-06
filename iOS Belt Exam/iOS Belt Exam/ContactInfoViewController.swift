//
//  ContactInfoViewController.swift
//  iOS Belt Exam
//
//  Created by Patrick O'Brien on 3/17/17.
//  Copyright © 2017 Patrick O'Brien. All rights reserved.
//

import UIKit

class ContactInfoViewController: UIViewController {
    
    weak var delegate: ContactInfoViewControllerDelegate?
    
    var item: ContactlistItem?
    
    var indexPath: NSIndexPath?

    @IBOutlet weak var LastNameTextField: UITextField!
    
    @IBOutlet weak var FirstNameTextField: UITextField!
    
    @IBOutlet weak var PhoneNumberTextField: UITextField!
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        delegate?.cancelButtonPressed(by: self)
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        var item = [String]()
        item.append(FirstNameTextField.text ?? "")
        item.append(LastNameTextField.text ?? "")
        item.append(PhoneNumberTextField.text ?? "")
        delegate?.itemSaved(by: self, with: item, at: indexPath)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirstNameTextField.text = item?.firstName
        LastNameTextField.text = item?.lastName
        PhoneNumberTextField.text = item?.phoneNumber
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
