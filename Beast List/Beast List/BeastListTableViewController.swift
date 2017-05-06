//
//  ViewController.swift
//  Beast List
//
//  Created by Patrick O'Brien on 3/22/17.
//  Copyright © 2017 Patrick O'Brien. All rights reserved.
//

import UIKit
import CoreData

class BeastListTableViewController: UITableViewController, AddBeastItemTableViewDelegate {
    
    let date = Date()
    let formatter = DateFormatter()
    var beastList = [BeastListItem]()
    
    
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAllItems()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beastList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! BeastListCell
        cell.beastListLabel.text = beastList[indexPath.row].text
        cell.dateLabel.text = ""
        return cell
    }
    
    
    
    func itemSaved(by controller: AddBeastItemTableViewController, with text: String, for indexPath: NSIndexPath?) {
        if let ip = indexPath {
            let item = beastList[ip.row]
            item.text = text
        } else {
            let item = NSEntityDescription.insertNewObject(forEntityName: "BeastListItem", into: managedObjectContext) as! BeastListItem
            item.text = text
            item.completed = false
            beastList.append(item)
            print("Besat List Item saved")
            print(beastList.count)
        }
        do {
            try managedObjectContext.save()
        } catch {
            print("\(error)")
        }
        
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Did select row", indexPath)
        performSegue(withIdentifier: "EditBeastListItemSegue", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let navigationController = segue.destination as! UINavigationController
            let addBeastListItemController = navigationController.topViewController as! AddBeastItemTableViewController
            addBeastListItemController.delegate = self
            if let currentSender = sender as? NSIndexPath {
                addBeastListItemController.beastListItem = beastList[currentSender.row]
            }
        
    }
    
    func fetchAllItems() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "BeastListItem")
        do {
            let result = try managedObjectContext.fetch(request)
            beastList = result as! [BeastListItem]
        } catch {
            print("\(error)")
        }
    }
    func cancelButtonPressed(by controller: AddBeastItemTableViewController) {
        dismiss(animated: true, completion: nil)
    }
    

}

