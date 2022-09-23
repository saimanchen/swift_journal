//
//  ExistingEntryViewController.swift
//  MyJournal
//
//  Created by Saiman Chen on 2022-09-06.
//

import UIKit

class ExistingEntryViewController: UIViewController {

    @IBOutlet weak var txtTitle: UITextView!
    @IBOutlet weak var txtContent: UITextView!
    
    var journalEntry: JournalEntry?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let journalEntry = journalEntry {
            txtTitle.text = journalEntry.title
            txtContent.text = journalEntry.content
        }
    }

    @IBAction func onSave(_ sender: Any) {
//        if let title = txtTitle.text,
//           let journal = journal,
//           let content = txtContent.text {
//            if title != "" && content != "" {
//                if switchDate.isOn {
//                    journal.addEntry(entry: JournalEntry(title: title, content: content, date: datePicker.date))
//                } else {
//                    journal.addEntry(entry: JournalEntry(title: title, content: content))
//                }
//                self.navigationController?.popViewController(animated: true)
//            }
//        }
    }
}
