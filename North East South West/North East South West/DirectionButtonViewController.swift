//
//  ViewController.swift
//  North East South West
//
//  Created by Patrick O'Brien on 3/14/17.
//  Copyright © 2017 Patrick O'Brien. All rights reserved.
//

import UIKit

class DirectionButtonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let directionViewController = segue.destination as! DirectionViewController
        directionViewController.delegate = self
    }
    

}

