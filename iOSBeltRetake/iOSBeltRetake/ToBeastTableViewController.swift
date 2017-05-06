//
//  ViewController.swift
//  iOSBeltRetake
//
//  Created by Patrick O'Brien on 4/24/17.
//  Copyright © 2017 Patrick O'Brien. All rights reserved.
//

import UIKit
import CoreData

class ToBeastTableViewController: UITableViewController, BeastListDelegate, CustomBeastCellDelegate {
    
    var beasts = [BeastListItem]()
    var unbeastedBeasts = [BeastListItem]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let dateBeasted = Date()
    let calendar = Calendar.current
    let doneBeasted = true
    
    
    
    @IBAction func addButtonPressed(_ sender: AnyObject) {
        performSegue(withIdentifier: "JustBeastIt", sender: -1)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchUnbeastedBeasts()
        appendBeasts(beasts: beasts)
        print(unbeastedBeasts)
        tableView.reloadData()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func justBeastIt(controller: JustBeastItTableViewController, didFinishAddingBeastTask task: String, date: Date, beasted: Bool) {
        let newBeast = NSEntityDescription.insertNewObject(forEntityName: "BeastListItem", into: context)
        do {
            newBeast.setValue(task, forKey: "task")
            newBeast.setValue(date, forKey: "date")
            newBeast.setValue(beasted, forKey: "beasted")
            try context.save()
            unbeastedBeasts.append(newBeast as! BeastListItem)
            
        } catch {
            print(error)
        }
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
    
    func editBeast(controller: JustBeastItTableViewController, didFinishEditingBeastTask task: String, date: Date, beasted: Bool) {
        dismiss(animated: true, completion: nil)
        if context.hasChanges {
            do {
                try context.save()
                print("Success, \(task) edited and saved!")
            } catch {
                print("Failure to save: \(error)")
            }
        }
        fetchUnbeastedBeasts()
        tableView.reloadData()
    }
    
    func fetchUnbeastedBeasts(){
        do{
            let results = try context.fetch(BeastListItem.fetchRequest())
            beasts = results as! [BeastListItem]
        } catch {
            print(error)
        }
    }
    
    func appendBeasts(beasts: [BeastListItem]){
        for beast in beasts {
            if beast.beasted == true {
                print("Beasted")
            } else {
                unbeastedBeasts.append(beast)
            }
        }
    }
    
    func cancelButtonPressed(controller: JustBeastItTableViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func didSelectButtonAtIndexPathOfCell(sender: CustomBeastCell) {
        let index = tableView.indexPath(for: sender)
        let row = (index?.row)!
        print((index?.row)!)
        let beastedBeast = unbeastedBeasts[row]
        do {
            beastedBeast.setValue(dateBeasted, forKey: "date")
            beastedBeast.setValue(doneBeasted, forKey: "beasted")
            try context.save()
            print("Success, \(beastedBeast) beasted!")
            print(beastedBeast.beasted)
        } catch {
            print("Failure to save: \(error)")
        }
        unbeastedBeasts.remove(at: row)
        fetchUnbeastedBeasts()
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return unbeastedBeasts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToBeastCell", for: indexPath) as! CustomBeastCell
        cell.cellDelegate = self
        
        cell.taskLabel.text = unbeastedBeasts[indexPath.row].task
        return cell
        
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let beastObject = unbeastedBeasts.remove(at: indexPath.row)
        context.delete(beastObject)
        do {
            try context.save()
            print("\(beastObject) deleted")
        } catch {
            print("Error in deleting \(beastObject)")
        }
        tableView.deleteRows(at: [indexPath], with: .automatic)
        fetchUnbeastedBeasts()
        tableView.reloadData()
        
    }

    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "JustBeastIt", sender: (indexPath as NSIndexPath).row)
        print("selected")
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navController = segue.destination as! UINavigationController
        let justBeastItController = navController.topViewController as! JustBeastItTableViewController
        justBeastItController.delegate = self
        if let currentSender = sender as? Int {
            if currentSender > -1 {
                justBeastItController.beast = unbeastedBeasts[currentSender]
                justBeastItController.indexPath = currentSender
                print("Sender is the table view cell")
            } else {
                print("Sender is the Add Button")
            }
        }
        
    }

}

