//
//  EventModel.swift
//  MyQuiz
//
//  Created by Cntt13 on 4/22/17.
//  Copyright © 2017 nguyenvanphituoc. All rights reserved.
//
//  (1) Sunday
//  (2) Sunday
//  (3) Sunday
//  (4) Sunday
//  (5) Sunday
//  (6) Sunday
//  (7) Sunday
import Foundation

final class EventModel : AbsEventModel
{

    var time: enumDayInWeek
    var description: String
    var title: String
    var status: enumStatus
    
    init()
    {
        self.title = "";
        self.description = "";
        self.time = .Sunday
        self.status = .Incoming
    }
    
    
    init(titled: String, description: String, status : enumStatus, time : enumDayInWeek)
    {
        self.title = titled
        self.description = description
        self.status = status
        self.time = time
    }
    
    init(source: EventModel)
    {
        self.title = source.title
        self.description = source.description
        self.status = source.status
        self.time = source.time
    }
    
    func copy(with zone: NSZone?) -> Any {
        let copy = EventModel(source: self)
        return copy
    }
    
    static func enumWeekToStringArray () -> [String] {
        
        var list : [String] = []
        for s in enumDayInWeek.allValues {
            list.append(s.rawValue)
        }
        return list
    }
    
    static func enumWeekToArray () -> [enumDayInWeek] {
        
        var list : [enumDayInWeek] = []
        for s in enumDayInWeek.allValues {
            list.append(s)
        }
        return list
    }

    static func findDayInWeek ( data: [enumDayInWeek] ,dayInWeek: enumDayInWeek) -> Int {
        
        for day in 0..<data.count {
            if dayInWeek == data[day] {
                return day
            }
        }
        return -1
    }

    
    static func parseDatetoString(day: Date) -> String {
        
        
        let dateString = "Thu, 22 Oct 2015 07:45:17 +0000"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, dd MMM yyyy hh:mm:ss +zzzz"
        dateFormatter.locale = Locale.init(identifier: "en_GB")
        
        let dateObj = dateFormatter.date(from: dateString)
        
        dateFormatter.dateFormat = "MM-dd-yyyy hh:mm:ss"
        return (dateFormatter.string(from: dateObj!))
    }
}
