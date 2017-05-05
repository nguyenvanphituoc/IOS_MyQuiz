//
//  EventController.swift
//  MyQuiz
//
//  Created by PhiTuocMacOS on 4/30/17.
//  Copyright © 2017 nguyenvanphituoc. All rights reserved.
//

import Foundation
public class EventController: AbsController {
    
    typealias Section = DayMoDel
    typealias Row  = AbsEventModel
    
    private var dayEvents : [Section]
    
    init(_ dayEvents: [Section]) {
        
        self.dayEvents = dayEvents
    }

    func getNumberOfSection() -> Int { return dayEvents.count }
  
    func getNumberOfRow(at indexSection: Int) -> Int { return dayEvents[indexSection].events.count }
  
    func getSectionName(at indexSection: Int) -> String { return dayEvents[indexSection].name.rawValue }
  
    func getSection(at indexSection: Int) -> Section? {
        
        if !isValidIndexPath(at: indexSection, row: 0) {
            return nil
        }
        return dayEvents[indexSection]
    }

    
    func getModel(at indexSection: Int, row indexRow: Int) -> Row? {
        
        if !isValidIndexPath(at: indexSection, row: indexRow) {
            return nil
        }
        return dayEvents[indexSection].events[indexRow]
    }
    
    func createModel (type abstractType: String) -> Row? {
        
        /// get namespace
        let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String;
        
        /// get 'anyClass' with classname and namespace
        do {
            let clsAny: AnyClass? = try NSClassFromString("\(namespace).\(abstractType)")
            
            guard let cls = clsAny else {
                return nil
            }
            
            let myItem = cls as! EventModel.Type
            let instanceItem = myItem.init()
    
            return instanceItem
            
        } catch is Error {
            return nil
        }
    }
    
    func moveModel(moveRowAt fromIndexPath: IndexPath, to: IndexPath) -> Bool{
        
        // get data was moved
        let modelTemp = self.getModel(at: fromIndexPath.section, row: fromIndexPath.row)
        guard var dump = modelTemp else {
            return false
        }
        // remove data from fromIndexPath
        if !self.removeModel(at: fromIndexPath.section, row: fromIndexPath.row) {
            return false
        }
        // insert data to toIndexpath
        if !self.insertModel(at: to.section, row: to.row, model: dump) {
            //rollback
            let _  = self.insertModel(at: fromIndexPath.section, row: fromIndexPath.row, model: dump)
            return false
        }
        // If change day <=> move another section
        if fromIndexPath.section != to.section {
            
            // change day
            dump.time = dayEvents[to.section].name
        }
        return true
    }

    
    func removeModel (at indexSection: Int, row indexRow: Int) -> Bool {
        
        if !isValidIndexPath(at: indexSection, row: indexRow) {
            return false
        }        
        dayEvents[indexSection].events.remove(at: indexRow) // that's okay
//        let day = dayEvents[indexSection]
//        day.events.remove(at: indexRow) // that's okay
//        var events = day.events
//        events.remove(at: indexRow)// that's error
        return true
    }
    
    func insertModel (at indexSection: Int, row indexRow: Int, model: Row) -> Bool {
        
        if !isValidIndexPath(at: indexSection, row: indexRow) {
            return false
        }
        dayEvents[indexSection].events.insert(model, at: indexRow)
        return true
    }
    
    func updateModel (at indexSection: Int, row indexRow: Int, model: Row) -> Bool {
        
        if !isValidIndexPath(at: indexSection, row: indexRow) {
            return false
        }
        return true
    }
    
    private func isValidIndexPath(at indexSection: Int, row indexRow: Int) -> Bool {
        
        if dayEvents.count < indexSection {
            return false
        }
        else if dayEvents[indexSection].events.count < indexRow {
            return false
        }
        return true
    }
}
