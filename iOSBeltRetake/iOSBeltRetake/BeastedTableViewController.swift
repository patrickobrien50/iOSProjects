//
//  BeastedTableViewController.swift
//  iOSBeltRetake
//
//  Created by Patrick O'Brien on 4/26/17.
//  Copyright © 2017 Patrick O'Brien. All rights reserved.
//

import UIKit

class BeastedTableViewController: UITableViewController {
    
    var beasts = [BeastListItem]()
    var beastedBeasts = [BeastListItem]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    

    override func viewDidLoad() {
        super.viewDidLoad()


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        fetchBeastedBeasts()
        beastedBeasts = [BeastListItem]()
        appendBeastedBeasts(beasts: beasts)
        tableView.reloadData()
    }
    
    
    func fetchBeastedBeasts(){
        do {
            let results = try context.fetch(BeastListItem.fetchRequest())
            beasts = results as! [BeastListItem]
        } catch {
            print(error)
        }
    }
    
    func appendBeastedBeasts(beasts: [BeastListItem]){
        for beast in beasts {
            if beast.beasted == false {
                print("Unbeasted")
            } else {
                beastedBeasts.append(beast)
            }
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return beastedBeasts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BeastedCell", for: indexPath)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, MMMM yyyy"
        let convertedDate = dateFormatter.string(from: beastedBeasts[indexPath.row].date! as Date)
        cell.textLabel?.text = beastedBeasts[indexPath.row].task
        cell.detailTextLabel?.text = convertedDate
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let beastObject = beastedBeasts.remove(at: indexPath.row)
        context.delete(beastObject)
        do {
            try context.save()
            print("\(beastObject) deleted")
        } catch {
            print("Error in deleting \(beastObject)")
        }
        tableView.deleteRows(at: [indexPath], with: .automatic)
        fetchBeastedBeasts()
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    




}
 

