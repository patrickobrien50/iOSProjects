//
//  WordsViewController.swift
//  Mad Libs
//
//  Created by Patrick O'Brien on 3/13/17.
//  Copyright © 2017 Patrick O'Brien. All rights reserved.
//

import UIKit

class WordsViewController: UIViewController {
    
    weak var delegate: MadLibDelegate?
    
    var words = [String?]()

    @IBOutlet weak var WordOneTextField: UITextField!
    
    @IBOutlet weak var WordTwoTextField: UITextField!
    
    @IBOutlet weak var WordThreeTextField: UITextField!
    
    @IBOutlet weak var WordFourTextField: UITextField!
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        let words = [WordOneTextField.text, WordTwoTextField.text, WordThreeTextField.text, WordFourTextField.text]
        delegate?.itemsSaved(by: self, with: words as! [String])
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
