//
//  Event.swift
//  TaskManagement
//
//  Created by BS00484 on 14/7/24.
//

import Foundation

var eventsList = [String:[Event]]()

struct Event {
    var title: String
    var dueDate: Date
    var description: String!
    var isCompleted: Bool
    
    init(title: String = "", description: String = "" ,dueDate: Date = Date.now, isCompleted: Bool = false) {
        self.title = title
        self.description = description
        self.dueDate = dueDate
        self.isCompleted = isCompleted
    }
}

#if DEBUG
extension Event {
    
    static var sampleData = [
        Event(title: "Hello",description: "hello world hello world", dueDate: Date.now,isCompleted: false ),
        Event(title: "Go to gym",description: "hello world hello world", dueDate: Date.now,isCompleted: false ),
        Event(title: "Have more fun",description: "hello world hello world", dueDate: Date.now,isCompleted: true ),
        Event(title: "Meooowww",description: "hello world hello world", dueDate: Date.now,isCompleted: false ),
        Event(title: "study smart",description: "hello world hello world", dueDate: Date.now,isCompleted: true )
    ]
}

#endif
