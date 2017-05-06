//
//  ViewController.swift
//  iOS Belt Exam
//
//  Created by Patrick O'Brien on 3/17/17.
//  Copyright © 2017 Patrick O'Brien. All rights reserved.
//

import UIKit
import CoreData

class ContactListTableViewController: UITableViewController, ContactInfoViewControllerDelegate, UIActionSheetDelegate {
    
    var items = [ContactlistItem]()
    
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
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! ContactCell
        cell.firstNameLabel.text = items[indexPath.row].firstName ?? ""
        cell.lastNameLabel.text = items[indexPath.row].lastName ?? ""
        cell.phoneNumberLabel.text = items[indexPath.row].phoneNumber ?? ""
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let optionMenu = UIAlertController(title: nil, message: "Choose Option", preferredStyle: .actionSheet)
        let deleteAction = UIAlertAction(title: "Delete", style: .default, handler: { (alert: UIAlertAction!) -> Void in
            let item = self.items[indexPath.row]
            self.managedObjectContext.delete(item)
            self.items.remove(at: indexPath.row)
            do {
                try self.managedObjectContext.save()
            } catch {
                print("\(error)")
            }
            tableView.reloadData()
        })
        
        let viewAction = UIAlertAction(title: "View", style: .default, handler: { (alert: UIAlertAction!) -> Void in
            self.performSegue(withIdentifier: "ViewContactSegue", sender: indexPath)
        })
        
        let editAction = UIAlertAction(title: "Edit", style: .default, handler: { (alert: UIAlertAction!) -> Void in
            self.performSegue(withIdentifier: "EditContactSegue", sender: indexPath)
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        optionMenu.addAction(viewAction)
        optionMenu.addAction(editAction)
        optionMenu.addAction(deleteAction)
        optionMenu.addAction(cancelAction)
        self.present(optionMenu, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ViewContactSegue" {
            let viewContactController = segue.destination as! ReadContactViewController
            let indexPath = sender as! NSIndexPath
            let item = items[indexPath.row]
            viewContactController.item = item
        }
        else {
            let navigationController = segue.destination as! UINavigationController
            let addContactController = navigationController.topViewController as! ContactInfoViewController
            addContactController.delegate = self
            if segue.identifier == "EditContactSegue" {
                let indexPath = sender as! NSIndexPath
                let item = items[indexPath.row]
                addContactController.item = item
                addContactController.indexPath = indexPath
                
            }
        }
    }
    
    func itemSaved(by controller: ContactInfoViewController, with text: [String?], at indexPath: NSIndexPath?) {
        if let ip = indexPath {
            let item = items[ip.row]
            item.firstName = text[0]
            item.lastName = text[1]
            item.phoneNumber = text[2]
        } else {
            let item = NSEntityDescription.insertNewObject(forEntityName: "ContactlistItem", into: managedObjectContext) as! ContactlistItem
            item.firstName = text[0]
            item.lastName = text[1]
            item.phoneNumber = text[2]
            items.append(item)
        }
        do {
            try managedObjectContext.save()
        } catch {
            print("\(error)")
        }
        
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
    
    func fetchAllItems() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ContactlistItem")
        do {
            let result = try managedObjectContext.fetch(request)
            items = result as! [ContactlistItem]
        } catch {
            print("\(error)")
        }
    }
    func cancelButtonPressed(by controller: ContactInfoViewController) {
        print("AGSDGAHG")
        dismiss(animated: true, completion: nil)
    }
}

