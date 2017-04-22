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


public enum enumStatus
{
    case Completed
    case Incoming
}

class EventModel
{
    var title: String
    var description: String
    var status: enumStatus
    var time : Date
    
    init()
    {
        self.title = "";
        self.description = "";
        self.time = Date()
        self.status = .Incoming
    }
    
    
    init(titled: String, description: String, status : enumStatus)
    {
        self.title = titled
        self.description = description
        self.status = status
        self.time = Date()
    }
}
