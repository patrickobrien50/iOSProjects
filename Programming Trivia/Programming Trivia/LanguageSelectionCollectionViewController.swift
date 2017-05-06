//
//  LanguageSelectionCollectionViewController.swift
//  Programming Trivia
//
//  Created by Patrick O'Brien on 5/3/17.
//  Copyright © 2017 Patrick O'Brien. All rights reserved.
//

import UIKit


class LanguageSelectionCollectionViewController: UICollectionViewController, TheDelegate {
    
    let languages = [(#imageLiteral(resourceName: "Python.png"), "Python"), (#imageLiteral(resourceName: "Swift.png"), "Swift"), (#imageLiteral(resourceName: "Javascript.png"), "Javascript"), (#imageLiteral(resourceName: "Objective-C.png"), "Objective-C")]
    
    let questionsArray = [
        [("What is the method in which you can find an array or list objects number of items?", "len()"),
         ("What symbol is used to create a comment in Python?", "#")],
        
        
        [("What is the method in which you can find an array or list objects number of items?", ".count"),
         ("What is the symbol used to create a comment in Swift?", "//")],
        
        
        [("What is the method in which you can find an array or list objects number of items?", ".length"),
         ("What is the symbol used to create a comment in Javascript?", "//")],
        
        
        [("What is the method in which you can find an array or list objects number of items?", ".count")]]

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
//        UserDefaults.standard.synchronize()
        if Themes.purchasedThemes == nil {
            UserDefaults.standard.set(["Default"], forKey: "myThemes")
        }
        if Themes.unpurchasedThemes == nil {
            UserDefaults.standard.set(["Red", "Blue", "Green", "Pink", "Rainbow", "Black"], forKey: "shopThemes")
        }
        if UserPoints.points == nil {
            UserDefaults.standard.set(100, forKey: "points")
        }
        print(Themes.purchasedThemes ?? "Nothing")
        print(Themes.unpurchasedThemes ?? "Nothing")
        print(UserPoints.points ?? 0)
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {
        
        let x = UserDefaults.standard.object(forKey: "currentTheme")
        if x == nil{
            UserDefaults.standard.set("Default", forKey: "currentTheme")
        }
        let currentTheme = UserDefaults.standard.object(forKey: "currentTheme") as? String
        
        switch currentTheme ?? "Default" {
        case "Red":
            self.collectionView?.backgroundColor = .red
            break;
        case "Blue":
            self.collectionView?.backgroundColor = .blue
            break;
        case "Pink":
            self.collectionView?.backgroundColor = UIColor.init(red: 255.0/255.0, green: 182.0/255.0, blue: 193.0/255.0, alpha: 1.0)
            break;
        case "Green":
            self.collectionView?.backgroundColor = .green
            break;
        case "Black":
            self.collectionView?.backgroundColor = .black
        default:
            self.collectionView?.backgroundColor = .white
            break;
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return languages.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! CustomLanguageCell
        
        cell.languageImage.image = languages[indexPath.row].0
        cell.layer.cornerRadius = cell.layer.frame.height/6
        cell.layer.borderWidth = 1.5
        let currentTheme = UserDefaults.standard.object(forKey: "currentTheme") as? String
        switch currentTheme ?? "Default" {
        case "Red":
            cell.layer.borderColor = Colors.yellowFont.cgColor
            break;
        case "Blue":
            cell.layer.borderColor = Colors.lightBlue.cgColor
            break;
        case "Pink":
            cell.layer.borderColor = Colors.lightPink.cgColor
            break;
        case "Green":
            cell.layer.borderColor = Colors.greenPurple.cgColor
            break;
        case "Black":
            cell.layer.borderColor = UIColor.white.cgColor
            break;
        default:
            cell.layer.borderColor = UIColor.black.cgColor

        }
        // Configure the cell
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "QuizSegue", sender: indexPath)
        Questions.questions = questionsArray[indexPath.row]
    }
    
    
    func dismissSettings(controller: SettingsViewController) {
        print("dismissed")
        dismiss(animated: true, completion: nil)
    
    }
    
    func dismissStore(controller: StoreViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SettingsSegue"{
            let navigationController = segue.destination as! UINavigationController
            let settingsController = navigationController.topViewController as! SettingsViewController
            settingsController.delegate = self
        } else if segue.identifier == "StoreSegue"{
            let navigationController = segue.destination as! UINavigationController
            let storeController = navigationController.topViewController as! StoreViewController
            storeController.delegate = self
        } else if segue.identifier == "QuizSegue" {
            let quizController = segue.destination as! QuestionsViewController
            if let currentSender = sender as? Int {
                quizController.questions = questionsArray[currentSender]
                print(currentSender)
            }

        }
    }
    
    

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
