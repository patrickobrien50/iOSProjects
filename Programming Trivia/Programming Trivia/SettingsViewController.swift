//
//  SettingsViewController.swift
//  Programming Trivia
//
//  Created by Patrick O'Brien on 5/3/17.
//  Copyright © 2017 Patrick O'Brien. All rights reserved.
//

import UIKit



class SettingsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var themes = Themes.purchasedThemes ?? [""]
    weak var delegate: TheDelegate?
    var currentTheme: String?
    
    
    
    

    @IBOutlet weak var themePicker: UIPickerView!
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        print("Pressed Done")
        delegate?.dismissSettings(controller: self)
        
    }
    
    
 

    override func viewDidLoad() {
        super.viewDidLoad()
        themePicker.dataSource = self
        themePicker.delegate = self
        changeTheme(currentTheme: currentTheme ?? "")



        // Do any additional setup after loading the view.
    }
    func changeTheme(currentTheme: String){
        switch currentTheme {
        case "Red":
            self.view.backgroundColor = .red
            break;
        case "Blue":
            self.view.backgroundColor = .blue
            break;
        case "Pink":
            self.view.backgroundColor = UIColor.init(red: 255.0/255.0, green: 182.0/255.0, blue: 193.0/255.0, alpha: 1.0)
            break;
        case "Green":
            self.view.backgroundColor = .green
            break;
        case "Black":
            self.view.backgroundColor = .black
            break;
        case "Rainbow":
            self.view.backgroundColor = UIColor.init(patternImage: #imageLiteral(resourceName: "rainbow"))
            break;
        default:
            self.view.backgroundColor = .white
            break;
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return themes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return themes[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //        UserDefaults.standard.set(themes[row], forKey: "currentTheme")
        let x = UserDefaults.standard.object(forKey: "currentTheme") as? String
        if x == nil{
            UserDefaults.standard.set("Default", forKey: "currentTheme")
        } else {
            UserDefaults.standard.set(themes[row], forKey: "currentTheme")
        }
        let currentTheme = UserDefaults.standard.object(forKey: "currentTheme") as? String
        changeTheme(currentTheme: currentTheme ?? "Default")
        print(currentTheme ?? "Default")
        
        UserDefaults.standard.set(row, forKey: "index")
        
        let a = UserDefaults.standard.object(forKey: "index") as? Int
        print(a!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let index = UserDefaults.standard.object(forKey: "index") as? Int
        themePicker.selectRow(index ?? 0, inComponent: 0, animated: true)
        let currentTheme = UserDefaults.standard.object(forKey: "currentTheme") as? String
        changeTheme(currentTheme: currentTheme ?? "Default")
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
