//
//  ViewController.swift
//  Event Tracker
//
//  Created by Patrick O'Brien on 3/23/17.
//  Copyright © 2017 Patrick O'Brien. All rights reserved.
//

import UIKit
import CoreData

class EventTrackerTableViewController: UITableViewController, AddEventViewControllerDelegate {
    
    var startedEvents = [NewEventItem]()
    
    var completedEvents = [NewEventItem]()
    
    let status = ["Incomplete", "Completed"]

    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return startedEvents.count
        }
        else {
            return completedEvents.count
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return status[section]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell") as! EventCell
            cell.eventTitleLabel.text = startedEvents[indexPath.row].eventTitle
            cell.eventTimeLabel.text = String(describing: startedEvents[indexPath.row].eventTime!)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell")
            cell?.textLabel?.text = completedEvents[indexPath.row].eventTitle
            return cell!
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = startedEvents[indexPath.row]
        item.completed = true 
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let addEventController = segue.destination as! AddEventViewController
            addEventController.delegate = self
            if segue.identifier == "EditEventSegue" {
                let indexPath = sender as! NSIndexPath
                let item = startedEvents[indexPath.row]
                addEventController.item = item
            }
            
            
    }
    
    func itemSaved(by controller: AddEventViewController, with text: [String], at time: NSDate, for indexPath: NSIndexPath?) {
        if let ip = indexPath {
            let item = startedEvents[ip.row]
            item.eventTitle = text[0]
            item.eventInfo = text[1]
            item.eventTime = time
        } else {
            let item = NSEntityDescription.insertNewObject(forEntityName: "NewEventItem", into: managedObjectContext) as! NewEventItem
            item.eventTitle = text[0]
            item.eventInfo = text[1]
            item.eventTime = time
            item.completed = false
            startedEvents.append(item)
        }
        do {
            try managedObjectContext.save()
        } catch {
            print("\(error)")
        }
        
        tableView.reloadData()
        dismiss(animated: true, completion: nil)    
    }
    
    func cancelButtonPressed(by controller: AddEventViewController) {
        print("Cancelled")
        dismiss(animated: true, completion: nil)
    }
    
    func fetchAllItems() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "NewEventItem")
        do {
            let result = try managedObjectContext.fetch(request)
            startedEvents = result as! [NewEventItem]
        } catch {
            print("\(error)")
        }
    }

}

