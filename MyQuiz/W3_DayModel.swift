//
//  EventDayModel.swift
//  MyQuiz
//
//  Created by Cntt13 on 4/22/17.
//  Copyright © 2017 nguyenvanphituoc. All rights reserved.
//

import Foundation
// Represents a generic product. Need an image named "default"

class DayMoDel
{
    // Variables
    var name: enumDayInWeek            // name of the product line
    var events: [AbsEventModel]     // all products in the line
    
    init(named: enumDayInWeek, includeEvents: [AbsEventModel])
    {
        name = named
        events = includeEvents
    }
    
    class func EventsInWeek() -> [DayMoDel]{
        // Once again, this is a computed property.
        // Every time you call this function, it will return the same data set.
        // It means number of item in the table view doesnt change.
        // That's why you got crashes
        // Understand?
        return [self.Sunday(), self.Monday(), self.Tuesday(), self.Webnesday(), self.Thursday(), self.Friday(), self.Saturday()]
    }
    
    
    class func Sunday() -> DayMoDel {
        
        var events = [EventModel]()
        
        events.append(EventModel(titled: "Wake up", description: "You have a dating at the next hour", status : enumStatus.Completed, time: enumDayInWeek.Sunday))
        events.append(EventModel(titled: "Brushing", description: "Brushing will take 5 minutes", status : enumStatus.Completed, time: enumDayInWeek.Sunday))
        events.append(EventModel(titled: "Breakfast", description: "15 minutes", status : enumStatus.Incoming, time: enumDayInWeek.Sunday))
        events.append(EventModel(titled: "Pick up Mimi", description: "Pick up her at 30 minutes", status : enumStatus.Incoming, time: enumDayInWeek.Sunday))
        events.append(EventModel(titled: "Go to Cinema", description: "I will going to ABC Cinema", status : enumStatus.Incoming, time: enumDayInWeek.Sunday))
        events.append(EventModel(titled: "Have lunch", description: "Have lunch with her at AAA restaurant", status : enumStatus.Incoming, time: enumDayInWeek.Sunday))
        events.append(EventModel(titled: "End dating", description: "Bring her come back =]]", status : enumStatus.Incoming, time: enumDayInWeek.Sunday))
        events.append(EventModel(titled: "Snap sleep", description: "I have snap sleep at 3:00PM", status : enumStatus.Incoming, time: enumDayInWeek.Sunday))
        events.append(EventModel(titled: "Continue Android project", description: "Do some task to get data from service api", status : enumStatus.Incoming, time: enumDayInWeek.Sunday))
        events.append(EventModel(titled: "Continue Ios project", description: "Completed mock project layout", status : enumStatus.Incoming, time: enumDayInWeek.Sunday))
        events.append(EventModel(titled: "Watching anime", description: "Watching Attack on Titan", status : enumStatus.Incoming, time: enumDayInWeek.Sunday))
        
        return DayMoDel(named: .Sunday, includeEvents: events)
    }
    
    class func Monday() -> DayMoDel {
        
        
        var events = [EventModel]()
        
        events.append(EventModel(titled: "Wake up", description: "Information Security Class will start at the next hour", status : enumStatus.Completed, time: enumDayInWeek.Monday))
        events.append(EventModel(titled: "Brushing", description: "Brushing will take 5 minutes", status : enumStatus.Completed, time: enumDayInWeek.Monday))
        events.append(EventModel(titled: "Breakfast", description: "15 minutes", status : enumStatus.Incoming, time: enumDayInWeek.Monday))
        events.append(EventModel(titled: "Go to school", description: "I will go to school in 30 minutes", status : enumStatus.Incoming, time: enumDayInWeek.Monday))
        events.append(EventModel(titled: "Have lunch", description: "Have lunch at 11:30AM with friend", status : enumStatus.Incoming, time: enumDayInWeek.Monday))
        events.append(EventModel(titled: "Snap sleep", description: "Save energy for next afternoon class", status : enumStatus.Incoming, time: enumDayInWeek.Monday))
        events.append(EventModel(titled: "Go home", description: "will go to home", status : enumStatus.Incoming, time: enumDayInWeek.Monday))
        events.append(EventModel(titled: "Preparing for INSE deadline", description: "preview about course", status : enumStatus.Incoming, time: enumDayInWeek.Monday))
        events.append(EventModel(titled: "Continue OOAD project", description: "understanding builder method of creation pattern", status : enumStatus.Incoming, time: enumDayInWeek.Monday))
        events.append(EventModel(titled: "Continue CLCO", description: "learning deploy web to google cloud", status : enumStatus.Incoming, time: enumDayInWeek.Monday))
        
        return DayMoDel(named: .Monday, includeEvents: events)

    }
    
    class func Tuesday() -> DayMoDel {
        
        
        var events = [EventModel]()
        
        events.append(EventModel(titled: "Wake up", description: "Information Security Class will start at the next hour", status : enumStatus.Completed, time: enumDayInWeek.Tuesday))
        events.append(EventModel(titled: "Brushing", description: "Brushing will take 5 minutes", status : enumStatus.Completed, time: enumDayInWeek.Tuesday))
        events.append(EventModel(titled: "Breakfast", description: "15 minutes", status : enumStatus.Incoming, time: enumDayInWeek.Tuesday))
        events.append(EventModel(titled: "Go to school", description: "I will go to school in 30 minutes", status : enumStatus.Incoming, time: enumDayInWeek.Tuesday))
        events.append(EventModel(titled: "Have lunch", description: "Have lunch at 11:30AM with friend", status : enumStatus.Incoming, time: enumDayInWeek.Tuesday))
        events.append(EventModel(titled: "Snap sleep", description: "Save energy for next subject", status : enumStatus.Incoming, time: enumDayInWeek.Tuesday))
        events.append(EventModel(titled: "Go home", description: "will go to home", status : enumStatus.Incoming, time: enumDayInWeek.Tuesday))
        events.append(EventModel(titled: "Do OOAD deadline", description: "completed feedback for method", status : enumStatus.Incoming, time: enumDayInWeek.Tuesday))
        events.append(EventModel(titled: "Do CLCO deadline", description: "completed upload cloud", status : enumStatus.Incoming, time: enumDayInWeek.Tuesday))
        events.append(EventModel(titled: "Continue Android project", description: "do some task", status : enumStatus.Incoming, time: enumDayInWeek.Tuesday))
        
        return DayMoDel(named: .Tuesday, includeEvents: events)

    }
    
    class func Webnesday() -> DayMoDel {
        
        
        var events = [EventModel]()
        
        events.append(EventModel(titled: "Wake up", description: "Information Security Class will start at the next hour", status : enumStatus.Completed, time: enumDayInWeek.Webnesday))
        events.append(EventModel(titled: "Brushing", description: "Brushing will take 5 minutes", status : enumStatus.Completed, time: enumDayInWeek.Webnesday))
        events.append(EventModel(titled: "Breakfast", description: "15 minutes", status : enumStatus.Incoming, time: enumDayInWeek.Webnesday))
        events.append(EventModel(titled: "Go to school", description: "I will go to school in 30 minutes", status : enumStatus.Incoming, time: enumDayInWeek.Webnesday))
        events.append(EventModel(titled: "Have lunch", description: "Have lunch at 11:30AM with friend", status : enumStatus.Incoming, time: enumDayInWeek.Webnesday))
        events.append(EventModel(titled: "Snap sleep", description: "Save energy for next subject", status : enumStatus.Incoming, time: enumDayInWeek.Webnesday))
        events.append(EventModel(titled: "Go home", description: "will go to home", status : enumStatus.Incoming, time: enumDayInWeek.Webnesday))
        events.append(EventModel(titled: "Do OOAD deadline", description: "completed quiz for method", status : enumStatus.Incoming, time: enumDayInWeek.Webnesday))
        events.append(EventModel(titled: "Continue Android project", description: "do some task", status : enumStatus.Incoming, time: enumDayInWeek.Webnesday))
        events.append(EventModel(titled: "Learning embeded system", description: "do homework of EBSY", status : enumStatus.Incoming, time: enumDayInWeek.Webnesday))
        
        return DayMoDel(named: .Webnesday, includeEvents: events)

    }
    
    class func Thursday() -> DayMoDel {
        
        
        var events = [EventModel]()
        
        events.append(EventModel(titled: "Wake up", description: "Information Security Class will start at the next hour", status : enumStatus.Completed, time: enumDayInWeek.Thursday))
        events.append(EventModel(titled: "Brushing", description: "Brushing will take 5 minutes", status : enumStatus.Completed, time: enumDayInWeek.Thursday))
        events.append(EventModel(titled: "Breakfast", description: "15 minutes", status : enumStatus.Incoming, time: enumDayInWeek.Thursday))
        events.append(EventModel(titled: "Go to school", description: "I will go to school in 30 minutes", status : enumStatus.Incoming, time: enumDayInWeek.Thursday))
        events.append(EventModel(titled: "Have lunch", description: "Have lunch at 11:30AM with friend", status : enumStatus.Incoming, time: enumDayInWeek.Thursday))
        events.append(EventModel(titled: "Snap sleep", description: "Save energy for next subject", status : enumStatus.Incoming, time: enumDayInWeek.Thursday))
        events.append(EventModel(titled: "Go home", description: "will go to home", status : enumStatus.Incoming, time: enumDayInWeek.Thursday))
        events.append(EventModel(titled: "Continue Ios project", description: "do some task of ios project", status : enumStatus.Incoming, time: enumDayInWeek.Thursday))
        events.append(EventModel(titled: "Continue Android project", description: "understanding next method of creation pattern", status : enumStatus.Incoming, time: enumDayInWeek.Thursday))
        events.append(EventModel(titled: "Building security web", description: "learning about vulnerable of vulnweb", status : enumStatus.Incoming, time: enumDayInWeek.Thursday))
        
        return DayMoDel(named: .Thursday, includeEvents: events)

    }
    
    class func Friday() -> DayMoDel {
        
        
        var events = [EventModel]()
        
        events.append(EventModel(titled: "Lazy Sleep", description: "changing energy", status : enumStatus.Completed, time: enumDayInWeek.Friday))
        events.append(EventModel(titled: "Brushing", description: "Brushing will take 5 minutes", status : enumStatus.Completed, time: enumDayInWeek.Friday))
        events.append(EventModel(titled: "Breakfast", description: "15 minutes", status : enumStatus.Incoming, time: enumDayInWeek.Friday))
        events.append(EventModel(titled: "Do ios project", description: "do some task of ios project", status : enumStatus.Incoming, time: enumDayInWeek.Friday))
        events.append(EventModel(titled: "Have lunch", description: "Have lunch at 11:30AM with friend", status : enumStatus.Incoming, time: enumDayInWeek.Friday))
        events.append(EventModel(titled: "Snap sleep", description: "Save energy for next subject", status : enumStatus.Incoming, time: enumDayInWeek.Friday))
        events.append(EventModel(titled: "Building security web", description: "learning about vulnerable of vulnweb", status : enumStatus.Incoming, time: enumDayInWeek.Friday))
        events.append(EventModel(titled: "Completed for INSE deadline", description: "do homework of INSE", status : enumStatus.Incoming, time: enumDayInWeek.Friday))
        events.append(EventModel(titled: "Continue OOAD project", description: "completed ooad project", status : enumStatus.Incoming, time: enumDayInWeek.Friday))
        events.append(EventModel(titled: "Continue CLCO", description: "completed clco project", status : enumStatus.Incoming, time: enumDayInWeek.Friday))
        
        return DayMoDel(named: .Friday, includeEvents: events)

    }
    
    class func Saturday() -> DayMoDel {
        
        
        var events = [EventModel]()
        
        events.append(EventModel(titled: "Wake up", description: "Information Security Class will start at the next hour", status : enumStatus.Completed, time: enumDayInWeek.Saturday))
        events.append(EventModel(titled: "Brushing", description: "Brushing will take 5 minutes", status : enumStatus.Completed, time: enumDayInWeek.Saturday))
        events.append(EventModel(titled: "Breakfast", description: "15 minutes", status : enumStatus.Incoming, time: enumDayInWeek.Saturday))
        events.append(EventModel(titled: "Go to school", description: "I will go to school in 30 minutes", status : enumStatus.Incoming, time: enumDayInWeek.Saturday))
        events.append(EventModel(titled: "Have lunch", description: "Have lunch at 11:30AM with friend", status : enumStatus.Incoming, time: enumDayInWeek.Saturday))
        events.append(EventModel(titled: "Snap sleep", description: "Save energy for next subject", status : enumStatus.Incoming, time: enumDayInWeek.Saturday))
        events.append(EventModel(titled: "Go home", description: "will go to home", status : enumStatus.Incoming, time: enumDayInWeek.Saturday))
        events.append(EventModel(titled: "Continue completed INSE deadline", description: "completed deadline", status : enumStatus.Incoming, time: enumDayInWeek.Saturday))
        events.append(EventModel(titled: "Continue Android project", description: "do some task of project", status : enumStatus.Incoming, time: enumDayInWeek.Saturday))
        events.append(EventModel(titled: "Continue Ios project", description: "do some task of project", status : enumStatus.Incoming, time: enumDayInWeek.Saturday))
        
        return DayMoDel(named: .Saturday, includeEvents: events)

    }
    
    
}
