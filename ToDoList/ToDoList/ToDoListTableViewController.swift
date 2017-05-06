//
//  ViewController.swift
//  ToDoList
//
//  Created by Patrick O'Brien on 3/20/17.
//  Copyright © 2017 Patrick O'Brien. All rights reserved.
//

import UIKit
import CoreData

class ToDoListTableViewController: UITableViewController, ToDoListDelegate {

    let moc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var toDoItems = [ToDoListItem]()
    
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
      
        return toDoItems.count
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! ToDoCustomCell
        cell.itemCellTitle.text = toDoItems[indexPath.row].itemTitle
        cell.itemCellDetails.text = toDoItems[indexPath.row].itemDescription
        cell.itemCellDate.text = String(describing: toDoItems[indexPath.row].itemDate!)
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let addItemViewController = segue.destination as! AddItemViewController
            addItemViewController.delegate = self
        
    }
    func itemSaved(by controller: AddItemViewController, with text: [String], with date: NSDate, for indexPath: NSIndexPath?) {
        if let ip = indexPath{
            let item = toDoItems[ip.row]
            item.itemTitle = text[0]
            item.itemDescription = text[1]
            item.itemDate = date
        } else {
            let item = NSEntityDescription.insertNewObject(forEntityName: "ToDoListItem", into: moc) as! ToDoListItem
            item.itemTitle = text[0]
            item.itemDescription = text[1]
            item.itemDate = date
            item.completed = false
            print(item)
            toDoItems.append(item)
        }
        
        do {
            try moc.save()
        }catch {
            print("\(error)")
        }
        
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
        
    }
    func fetchAllItems() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ToDoListItem")
        do {
            let result = try moc.fetch(request)
            toDoItems = result as! [ToDoListItem]
        } catch {
            print("\(error)")
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let todoItem = self.toDoItems[indexPath.row]
        todoItem.completed = !todoItem.completed
        do {
            try moc.save()
        } catch {
            print("\(error)")
        }
        
        let cell = tableView.cellForRow(at: indexPath)
        if todoItem.completed {
            cell?.accessoryType = .checkmark
        } else {
            cell?.accessoryType = .none
        }
        
    }


}

