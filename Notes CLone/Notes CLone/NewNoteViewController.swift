//
//  NewNoteViewController.swift
//  Notes CLone
//
//  Created by Patrick O'Brien on 3/21/17.
//  Copyright © 2017 Patrick O'Brien. All rights reserved.
//

import UIKit

class NewNoteViewController: UIViewController, UITextViewDelegate {
    
    let date = Date()
    
    let formatter = DateFormatter()
    
    weak var delegate: NewNoteDelegate?
    
    var item: NewNoteItem?
    
    var indexPath: NSIndexPath?
    
    var text: String = ""
    
    @IBOutlet weak var newNoteTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newNoteTextView.text = item?.details
        newNoteTextView.delegate = self
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textViewDidChange(_ textView: UITextView) {
        text = newNoteTextView.text
        print(text)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if newNoteTextView.text != "" {
            formatter.dateFormat = "MM-dd-YY"
            let today = formatter.string(from: date)
            text = newNoteTextView.text
            delegate?.itemSaved(by: self, with: text, with: today, for: indexPath)
            print("View Disappeared")
            print(text)
        } else {
            print("Not Saved")
        }
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
