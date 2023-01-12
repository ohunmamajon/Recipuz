//
//  Event.swift
//  My app
//
//  Created by Okhunjon Mamajonov on 2023/01/12.
//

import Foundation

var eventList = [Event]()

class Event {
    var id: Int!
    var name: String!
    var date: Date!
    
    func eventsForDate(date: Date) -> [Event] {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy"
       var newDate = dateFormatter.string(from: date)
        var daysEvents = [Event]()
        for event in eventList {
            let updatedEventDate = dateFormatter.string(from: event.date)
            if (updatedEventDate == newDate)
            {
                daysEvents.append(event)
            }
             
        }
        return daysEvents
    }
}
