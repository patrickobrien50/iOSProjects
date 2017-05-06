//
//  ViewController.swift
//  Binary Counter
//
//  Created by Patrick O'Brien on 3/19/17.
//  Copyright © 2017 Patrick O'Brien. All rights reserved.
//

import UIKit

class BinaryTableViewController: UITableViewController {
    var numbers = [1]
    
    let cells = 16

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell") as! CustomCell
        cell.binaryLabel.text = String(numbers[indexPath.row])
        var powerOfTen = numbers[indexPath.row]
        powerOfTen = powerOfTen * 10
        numbers.append(powerOfTen)
        return cell
    }

}

