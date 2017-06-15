//
//  StoreViewController.swift
//  Programming Trivia
//
//  Created by Patrick O'Brien on 5/3/17.
//  Copyright © 2017 Patrick O'Brien. All rights reserved.
//

import UIKit

class StoreViewController: UIViewController {
    
    weak var delegate: TheDelegate?

    @IBOutlet weak var shopTableView: UITableView!
    @IBOutlet weak var pointsLabel: UILabel!
    var purchasedThemes = Themes.purchasedThemes ?? [""]
    var shopThemes = Themes.unpurchasedThemes ?? [""]
    var points = UserPoints.points ?? 0
    
    func animateTable() {
        shopTableView.reloadData()
        let cells = shopTableView.visibleCells
        
        let tableViewHeight = shopTableView.bounds.size.height
        
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
            
        }
        var delayCounter = 0
        for cell in cells {
            UIView.animate(withDuration: 1.75, delay: Double(delayCounter) * 0.05, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                cell.transform =  CGAffineTransform.identity
            }, completion: nil)
            delayCounter += 1
        }
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        pointsLabel.text = "Points: " + String(describing: points)
        let currentTheme = UserDefaults.standard.object(forKey: "currentTheme") as? String
        switch currentTheme ?? "Default" {
        case "Red":
            self.view.backgroundColor = .red
            shopTableView.backgroundColor = Colors.lightBlue
            pointsLabel.textColor = UIColor.init(red: 255.0/255.0, green: 200.0/255.0, blue: 100.0/255.0, alpha: 1.0)
            break;
        case "Blue":
            self.view.backgroundColor = .blue
            pointsLabel.textColor = UIColor.init(red: 105.0/255.0, green: 200.0/255.0, blue: 255.0/255.0, alpha: 1.0)
            break;
        case "Pink":
            self.view.backgroundColor = UIColor.init(red: 255.0/255.0, green: 182.0/255.0, blue: 193.0/255.0, alpha: 1.0)
            pointsLabel.textColor = UIColor.init(red: 255.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, alpha: 1.0)
            break;
        case "Green":
            self.view.backgroundColor = .green
            shopTableView.backgroundColor = Colors.greenPurple
            pointsLabel.textColor = UIColor.init(red: 255.0/255.0, green: 0.0/255.0, blue: 255.0/255.0, alpha: 1.0)
            break;
        default:
            self.view.backgroundColor = .white
            break;
        }
        shopTableView.delegate = self
        shopTableView.dataSource = self
        
     


        // Do any additional setup after loading the view.
    }

    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        delegate?.dismissStore(controller: self)
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        purchasedThemes = Themes.purchasedThemes ?? [""]
        shopThemes = Themes.unpurchasedThemes ?? [""]
        points = UserPoints.points ?? 0
        
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


extension StoreViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shopThemes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = shopTableView.dequeueReusableCell(withIdentifier: "StoreCell", for: indexPath)
        cell.textLabel?.text = shopThemes[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if points >= 50 {
            points = points - 50
            UserDefaults.standard.set(points, forKey: "points")
            UserPoints.points = points
            purchasedThemes.append(shopThemes[indexPath.row])
            UserDefaults.standard.set(purchasedThemes, forKey: "myThemes")
            shopThemes.remove(at: indexPath.row)
            Themes.unpurchasedThemes?.remove(at: indexPath.row)
            UserDefaults.standard.set(shopThemes, forKey: "shopThemes")
            Themes.purchasedThemes = purchasedThemes
            pointsLabel.text = "Points: " + String(describing: points)
        } else {
            print("Not enough points")
        }
        shopTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateTable()
    }
    
    
    
}
