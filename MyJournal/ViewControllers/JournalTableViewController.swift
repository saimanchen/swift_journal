//
//  JournalTableViewController.swift
//  MyJournal
//
//  Created by Saiman Chen on 2022-09-06.
//

import UIKit

class JournalTableViewController: UITableViewController {
    
    @IBOutlet var myTableView: UITableView!
    
    
    let tableViewToEntrySegue = "tableViewToEntrySegue"
    let tableViewToExistingSegue = "tableViewToExistingSegue"
    var journalCell = "JournalCell"
    var journal = Journal()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        journal.addEntry(entry: JournalEntry(title: "Idag", content: "Idag gick jag på en lektion"))
        journal.addEntry(entry: JournalEntry(title: "Mitt läge", content: "Jag mår jättebra"))
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        myTableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return journal.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: journalCell, for: indexPath)
        
        // Configure the cell...
        var content = cell.defaultContentConfiguration()
        
        if let entry = journal.getEntryAt(index: indexPath.row) {
            content.text = "\(entry.date) \(entry.title)"
        }
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
     // Override to support editing the table view.
//     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//     if editingStyle == .delete {
//     // Delete the row from the data source
////     tableView.deleteRows(at: [indexPath], with: .fade)
//         journal.removeEntry(index: indexPath.row)
//     } else if editingStyle == .insert {
//     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//     }
//         myTableView.reloadData()
//     }
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let remove = UIContextualAction(style: .destructive, title: "Delete", handler: {(action, view, completion) in
            self.journal.removeEntry(index: indexPath.row)
            self.myTableView.reloadData()
        })
        
        let actions = UISwipeActionsConfiguration(actions: [remove])
        
        return actions
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let remove = UIContextualAction(style: .destructive, title: "Delete", handler: {(action, view, completion) in
            self.journal.removeEntry(index: indexPath.row)
//            self.myTableView.reloadData()
            self.myTableView.deleteRows(at: [indexPath], with: .fade)
        })
        
        let test = UIContextualAction(style: .normal, title: "Test", handler: {(action, view, completion) in
            self.performSegue(withIdentifier: self.tableViewToExistingSegue, sender: self)
        })
        
        test.backgroundColor = UIColor.init(red: 120/255, green: 120/255, blue: 120/255, alpha: 1.0)
        
        let actions = UISwipeActionsConfiguration(actions: [remove, test])
        
        return actions
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case tableViewToEntrySegue:
            if let destinationVC = segue.destination as? CreateEntryViewController {
                destinationVC.journal = self.journal
                break
            }
        case tableViewToExistingSegue:
            // skicka genom segue
//            if let destinationVC = segue.destination as? ExistingEntryViewController,
//               let selectedCellIndex = myTableView.indexPathForSelectedRow?.row {
//                let selectedEntry = journal.getEntryAt(index: selectedCellIndex)
//                destinationVC.journalEntry = selectedEntry
//            }
            // skicka med sender
//            if let destinationVC = segue.destination as? ExistingEntryViewController,
//               let cell = sender as? UITableViewCell,
//               let indexPath = myTableView.indexPath(for: cell),
//               let entry = journal.getEntryAt(index: indexPath.row) {
//                destinationVC.journalEntry = entry
//            }
            
            guard let destinationVC = segue.destination as? ExistingEntryViewController else { return }
            guard let cell = sender as? UITableViewCell else { return }
            guard let indexPath = myTableView.indexPath(for: cell) else { return }
            guard let entry = journal.getEntryAt(index: indexPath.row) else { return }
            
            destinationVC.journalEntry = entry

            break
        default: return
        }
        
    }
}

