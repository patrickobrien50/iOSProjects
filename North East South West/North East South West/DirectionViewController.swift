//
//  DirectionViewController.swift
//  North East South West
//
//  Created by Patrick O'Brien on 3/14/17.
//  Copyright © 2017 Patrick O'Brien. All rights reserved.
//

import UIKit

class DirectionViewController: UIViewController {
    
    var delegate: DirectionViewDelegate?
    
    var direction: String?

    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        delegate?.cancelButtonPressed(by: DirectionButtonViewController)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
