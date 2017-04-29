//
//  AbsEventModel.swift
//  MyQuiz
//
//  Created by PhiTuocMacOS on 4/25/17.
//  Copyright © 2017 nguyenvanphituoc. All rights reserved.
//

import Foundation

public enum enumStatus
{
    case Completed
    case Incoming
}

public enum enumDayInWeek : String // raw type
{
    case Sunday = "Sunday"
    case Monday = "Monday"
    case Tuesday = "TuesDay"
    case Webnesday = "Webnesday"
    case Thursday  = "Thursday"
    case Friday    = "Friday"
    case Saturday  = "Saturday"
}

// use abstract model when i must change eventmodel to eventmodel bester and not need fix more hardcode
protocol AbsEventModel {

    var title: String        { get set }
    var description: String  { get set }
    var status: enumStatus   { get set }
    var time : enumDayInWeek { get set }
    
    static func parseDatetoString( day : Date) -> String
}
