//
//  ReadContactViewController.swift
//  iOS Belt Exam
//
//  Created by Patrick O'Brien on 3/19/17.
//  Copyright © 2017 Patrick O'Brien. All rights reserved.
//

import UIKit

class ReadContactViewController: UIViewController {
    
    var item: ContactlistItem?

    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameLabel.text = item?.firstName
        lastNameLabel.text = item?.lastName
        phoneNumberLabel.text = item?.phoneNumber

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
