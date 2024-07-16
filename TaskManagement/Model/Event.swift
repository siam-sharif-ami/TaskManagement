//
//  Event.swift
//  TaskManagement
//
//  Created by BS00484 on 14/7/24.
//

import Foundation

var eventsList = [String:[Event]]()

class Event {
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
    
    func eventsForDate(date: Date) -> [Event] {
        
        var daysEvents = [Event]()
        if let eventsForTheDay = eventsList[CalendarDataSource().dayMonthYearString(date: date)] {
            for event in eventsForTheDay {
                daysEvents.append(event)
            }
        }
        return daysEvents
    }
    
    func thisMonthsPendingEvents(date: Date) -> [Event]{
        
        var monthsPendingItems = [Event]()
        let monthName: String = CalendarDataSource().monthString(date: date)
        
        print(monthName)
        for date in eventsList {
            let dateKeyComponents = date.key.split(separator: " ")
            /// dateKeyComponents return 15 Jul 2024 in an array
            /// 
            if monthName == dateKeyComponents[1] {
                let arrayOfEvents = date.value
                for event in arrayOfEvents {
                    if event.isCompleted == false {
                        monthsPendingItems.append(event)
                    }
                }
            }
        }
        return monthsPendingItems
    }
}
