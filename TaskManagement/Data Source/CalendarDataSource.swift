//
//  CalendarDataSource.swift
//  TaskManagement
//
//  Created by BS00484 on 11/7/24.
//

import Foundation
import UIKit

class CalendarDataSource {
    let calendar = Calendar.current
    
    func plusMonth(date: Date) -> Date {
        return calendar.date(byAdding: .month, value: 1, to: date)!
    }
    
    func minusMonth(date: Date) -> Date {
        return calendar.date(byAdding: .month, value: -1, to: date)!
    }
    
    func currentDateString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        return dateFormatter.string(from: date)
    }
    
    func monthString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLL"
        return dateFormatter.string(from: date)
    }
    
    func yearString(date: Date) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter.string(from: date)
    }
    
    func dayString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE"
        return dateFormatter.string(from: date)
    }
    func timeString(date: Date) -> String{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }
    
    func daysInMonth(date: Date) -> Int{
        
        let range = calendar.range(of: .day, in: .month, for: date)!
        return range.count
    }
    func dayOfMonth(date: Date) -> Int{
        
        let components = calendar.dateComponents([.day], from: date)
        return components.day!
    }
    func firstOfMonth(date: Date) -> Date{
        
        let components = calendar.dateComponents([.year, .month], from: date)
        return calendar.date(from: components)!
    }
    func weekDay(date: Date) -> Int{
        
        let components = calendar.dateComponents([.weekday], from: date)
        return components.weekday! - 1
    }
    func addDays(date: Date, days: Int) -> Date {
        
        return calendar.date(byAdding: .day, value: days, to: date)!
    }
    func sundayForDate(date: Date) -> Date {
        
        var current = date
        let oneWeekAgo = addDays(date: current, days: -7)
        
        while(current > oneWeekAgo)
        {
            let currentWeekDay = calendar.dateComponents([.weekday], from: current).weekday
            if(currentWeekDay == 1)
            {
                return current
            }
            current = addDays(date: current, days: -1)
        }
        return current
    }
    func dayMonthYearString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy" // Example format: 14 Jul 2024
        return dateFormatter.string(from: date)
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
    
    func printAllEventsList(){
        for (date,events) in eventsList {
            print("\(date) ---> ")
            for event in events {
                print(event.title)
                print(event.dueDate)
                print(event.isCompleted)
            }
        }
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
    
    func thisMonthsDoneEvents(date: Date) -> [Event]{
        var monthsDoneItems = [Event]()
        let monthName: String = CalendarDataSource().monthString(date: date)
        
        for date in eventsList {
            let dateKeyComponents = date.key.split(separator: " ")
            
            if monthName == dateKeyComponents[1] {
                let arrayOfEvents = date.value
                for event in arrayOfEvents {
                    if event.isCompleted == true {
                        monthsDoneItems.append(event)
                    }
                }
            }
        }
        return monthsDoneItems
    }
}

extension Date {
    var dayAndTimeText: String {
        let timeText = formatted(date: .omitted, time: .shortened)
        if Locale.current.calendar.isDateInToday(self){
            let timeFormat = NSLocalizedString("Today at %@", comment: "Today at time format string")
            return String(format: timeFormat, timeText)
        }else {
            let dateText = formatted(.dateTime.month(.abbreviated).day())
            let dateAndTimeFormat = NSLocalizedString("%@ at %@", comment: "Date and time format string")
            return String(format: dateAndTimeFormat, dateText, dateAndTimeFormat)
        }
    }
}
