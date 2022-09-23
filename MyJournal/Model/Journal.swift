//
//  Journal.swift
//  MyJournal
//
//  Created by Saiman Chen on 2022-09-06.
//

import Foundation

class Journal {
    
    private var journalEntries = [JournalEntry]()
    
    var count: Int {
        return journalEntries.count
    }
    
    func addEntry(entry: JournalEntry) {
        if entry.content == "" {
            return
        }
        
        journalEntries.append(entry)
    }
    
    func removeEntry(index: Int) {
        journalEntries.remove(at: index)
    }
    
    func getEntryAt(index: Int) -> JournalEntry? {
        
        if index >= 0 && index < journalEntries.count {
            return journalEntries[index]
        }
        
        return nil
    }
}
