//
//  ViewController.swift
//  Notes CLone
//
//  Created by Patrick O'Brien on 3/21/17.
//  Copyright © 2017 Patrick O'Brien. All rights reserved.
//

import UIKit
import CoreData

class DisplayNotesViewController: UIViewController, NewNoteDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var notesSearchBar: UISearchBar!
    
    var notes = [NewNoteItem]()
    var filteredNotes = [NewNoteItem]()
    var searching: Bool = false
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var notesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notesTableView.dataSource = self
        notesTableView.delegate = self
        notesSearchBar.delegate = self
        fetchAllItems()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func itemSaved(by controller: NewNoteViewController, with text: String, with date: String, for indexPath: NSIndexPath?) {
        if let ip = indexPath {
            let item = notes[ip.row]
            item.details = text
            item.dateCreated = date
        } else {
            let item = NSEntityDescription.insertNewObject(forEntityName: "NewNoteItem", into: managedObjectContext) as! NewNoteItem
            item.details = text
            item.dateCreated = date 
            notes.append(item)
            print("Item SAved")
            print(notes.count)
        }
        do {
            try managedObjectContext.save()
        } catch {
            print("\(error)")
        }
        
        notesTableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let newNoteController = segue.destination as! NewNoteViewController
        newNoteController.delegate = self
        if segue.identifier == "EditNoteSegue" {
            let indexPath = sender as! NSIndexPath
            let item = notes[indexPath.row]
            newNoteController.item = item
            newNoteController.indexPath = indexPath
            }
            
        }
    func fetchAllItems() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "NewNoteItem")
        do {
            let result = try managedObjectContext.fetch(request)
            notes = result as! [NewNoteItem]
        } catch {
            print("\(error)")
        }
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searching = true
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searching = false
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredNotes = notes.filter({ (text) -> Bool in
            let tmp = text.details! as NSString
            let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
            return range.location != NSNotFound
        })
        if filteredNotes.count == 0{
            searching = false
        } else {
            searching = true
        }
        notesTableView.reloadData()
    }
    
        
}



extension DisplayNotesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return filteredNotes.count
        }else {
            return notes.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if searching == true {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
            cell.textLabel?.text = filteredNotes[indexPath.row].details
            cell.detailTextLabel?.text = String(describing: filteredNotes[indexPath.row].dateCreated!)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
            cell.textLabel?.text = notes[indexPath.row].details
            cell.detailTextLabel?.text = String(describing: notes[indexPath.row].dateCreated!)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "EditNoteSegue", sender: indexPath)
    }
}
