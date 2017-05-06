//
//  ViewController.swift
//  Mad Libs
//
//  Created by Patrick O'Brien on 3/13/17.
//  Copyright © 2017 Patrick O'Brien. All rights reserved.
//

import UIKit

class MabLibViewController: UIViewController, MadLibDelegate {

    
    @IBOutlet weak var MadLibLabel: UILabel!
    
    let sentences = [("I saw a", "and it was", ". It looked", " and it got in a fight with a"), ("Hello There", ". You should be", "and you look a little", ". You should try sleeping with a"), ("This is a silly", "and it is", "and it needs to go run around with a", "")]
    let randomSentence = Int(arc4random_uniform(3))
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let wordViewController = segue.destination as! WordsViewController
        wordViewController.delegate = self
    }
    
    
    

    func itemsSaved(by controller: WordsViewController, with text: [String]) {
        MadLibLabel.text = "\(sentences[randomSentence].0) \(text[0]) \(sentences[randomSentence].1)  \(text[1])  \(sentences[randomSentence].2) \(text[2]) \(sentences[randomSentence].3) \(text[3])"
        dismiss(animated: true, completion: nil)
    }

}

