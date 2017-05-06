//
//  FirstViewController.swift
//  Music Player Project
//
//  Created by Patrick O'Brien on 3/27/17.
//  Copyright © 2017 Patrick O'Brien. All rights reserved.
//

import UIKit
import MediaPlayer


class FirstViewController: UITableViewController {

    let songsQuery = MPMediaQuery.songs()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func requestAuthorization(_ handler: @escaping (MPMediaLibraryAuthorizationStatus) -> Void){
        switch MPMediaLibraryAuthorizationStatus {
        case authorized:
            <#code#>
        default:
            <#code#>
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        let songsArray = [songsQuery]
        return songsArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // let songsArray = [songsQuery]
        // let rowItem = songsArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = String(describing: indexPath)
        return cell
    }

}

