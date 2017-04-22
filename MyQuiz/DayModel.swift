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
    var name: String            // name of the product line
    var events: [EventModel]     // all products in the line
    
    init(named: String, includeEvents: [EventModel])
    {
        name = named
        events = includeEvents
    }
    
    class func EventsInWeak() -> [DayMoDel]{
        return [self.Sunday(), self.Monday(), self.Tuesday(), self.Webnesday(), self.Thursday(), self.Friday(), self.Saturday()]
    }
    
    
    class func Sunday() -> DayMoDel {
        
        var events = [EventModel]()
        
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        
        return DayMoDel(named: "Sunday", includeEvents: events)
    }
    
    class func Monday() -> DayMoDel {
        
        
        var events = [EventModel]()
        
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        
        return DayMoDel(named: "Monday", includeEvents: events)

    }
    
    class func Tuesday() -> DayMoDel {
        
        
        var events = [EventModel]()
        
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        
        return DayMoDel(named: "Tuesday", includeEvents: events)

    }
    
    class func Webnesday() -> DayMoDel {
        
        
        var events = [EventModel]()
        
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        
        return DayMoDel(named: "Webnesday", includeEvents: events)

    }
    
    class func Thursday() -> DayMoDel {
        
        
        var events = [EventModel]()
        
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        
        return DayMoDel(named: "Thursday", includeEvents: events)

    }
    
    class func Friday() -> DayMoDel {
        
        
        var events = [EventModel]()
        
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        
        return DayMoDel(named: "Friday", includeEvents: events)

    }
    
    class func Saturday() -> DayMoDel {
        
        
        var events = [EventModel]()
        
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        events.append(EventModel(titled: "Wake up", description: "Tới giờ học bảo mật thông tin rồi", status : enumStatus.Incoming))
        
        return DayMoDel(named: "Saturday", includeEvents: events)

    }
    
    
}
