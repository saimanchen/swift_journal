//
//  JournalEntry.swift
//  MyJournal
//
//  Created by Saiman Chen on 2022-09-06.
//

import Foundation

// definierar en enskild entry i vår journal
struct JournalEntry {
    private var formatter = DateFormatter()
    private var unformattedDate: Date
    var title: String
    var content: String
    
//    var date = formatter.string(from: unformattedDate)
    var date: String {
        return formatter.string(from: unformattedDate)
    }
    
    
    init(title: String, content: String) {
        
//        self.formatter.dateStyle = .short
        self.formatter.dateFormat = "yyyy-MM-dd"
        self.title = title
        self.content = content
        self.unformattedDate = Date()
    }
    
    init(title: String, content: String, date: Date) {
//        self.formatter.dateStyle = .short
        self.formatter.dateFormat = "yyyy-MM-dd"
        self.title = title
        self.content = content
        self.unformattedDate = date
    }
}
