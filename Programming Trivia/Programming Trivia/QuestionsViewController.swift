//
//  ViewController.swift
//  Programming Trivia
//
//  Created by Patrick O'Brien on 5/3/17.
//  Copyright © 2017 Patrick O'Brien. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {

    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var answerTextField: UITextField!
    
    var questions: [(String, String)]?
    var points = UserPoints.points ?? 0
    var index = 0
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        if index == (questions?.count)! - 1 {
            index = 0
        } else {
            index += 1
        }
        questionLabel.text = questions?[index].0
        answerLabel.text = questions?[index].1
        answerLabel.isHidden = true
        answerTextField.text = ""
        submitButton.isEnabled = true

        
    }
    
    
    
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        answerLabel.isHidden = false
        if answerTextField.text == answerLabel.text {
            points += 10
            UserDefaults.standard.set(points, forKey: "points")
            UserPoints.points = points
        } else {
            print("Wrong Answer")
        }
        submitButton.isEnabled = false
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questions = Questions.questions
        print(questions ?? "nothing")
        questionLabel.text = questions?[index].0
        answerLabel.text = questions?[index].1
        answerLabel.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let currentTheme = UserDefaults.standard.object(forKey: "currentTheme") as? String
        switch currentTheme ?? "Default" {
        case "Red":
            self.view.backgroundColor = .red
            questionLabel.textColor = UIColor.init(red: 255.0/255.0, green: 200.0/255.0, blue: 100.0/255.0, alpha: 1.0)
            answerLabel.textColor = UIColor.init(red: 255.0/255.0, green: 220.0/255.0, blue: 120.0/255.0, alpha: 1.0)
            submitButton.setTitleColor(Colors.yellowFont, for: .normal)
            skipButton.setTitleColor(Colors.yellowFont, for: .normal)

            break;
        case "Blue":
            self.view.backgroundColor = .blue
            questionLabel.textColor = UIColor.init(red: 105.0/255.0, green: 200.0/255.0, blue: 255.0/255.0, alpha: 1.0)
            answerLabel.textColor = UIColor.init(red: 130.0/255.0, green: 220.0/255.0, blue: 255.0/255.0, alpha: 1.0)
            break;
        case "Pink":
            self.view.backgroundColor = UIColor.init(red: 255.0/255.0, green: 182.0/255.0, blue: 193.0/255.0, alpha: 1.0)
            questionLabel.textColor = UIColor.init(red: 255.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, alpha: 1.0)
            answerLabel.textColor = UIColor.init(red: 255.0/255.0, green: 200.0/255.0, blue: 200.0/255.0, alpha: 1.0)
            break;
        case "Green":
            self.view.backgroundColor = .green
            questionLabel.textColor = UIColor.init(red: 255.0/255.0, green: 0.0/255.0, blue: 255.0/255.0, alpha: 1.0)
            answerLabel.textColor = UIColor.init(red: 255.0/255.0, green: 20.0/255.0, blue: 240.0/255.0, alpha: 1.0)
            break;
        default:
            self.view.backgroundColor = .white
            break;
        }

        
    }

}

