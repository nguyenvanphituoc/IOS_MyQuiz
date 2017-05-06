//
//  W5_StudentController.swift
//  MyQuiz
//
//  Created by PhiTuocMacOS on 5/6/17.
//  Copyright © 2017 nguyenvanphituoc. All rights reserved.
//

import Foundation

public class W5_StudentController: W5_AbsController {
    
    typealias Section = W5_UniversityModel
    typealias Row  = W5_AbsStudent
    
    private var studentOfUnivers : [Section]
    
    init(_ dayEvents: [Section]) {
        
        self.studentOfUnivers = dayEvents
    }
    
    func getNumberOfSection() -> Int {
        
        return studentOfUnivers.count
    }
    
    func getNumberOfRow(at indexSection: Int) -> Int {
        
        if !isUnwrapOpt(studentOfUnivers[indexSection].Students) {
            return 0
        }
        return studentOfUnivers[indexSection].Students!.count
    }
    
    func getSectionName(at indexSection: Int) -> String {
        
        return studentOfUnivers[indexSection].uName
    }
    
    func getSection(at indexSection: Int) -> Section? {
        
        if !isValidIndexPath(at: indexSection, row: 0) {
            return nil
        }
        return studentOfUnivers[indexSection]
    }
    
    
    func getModel(at indexSection: Int, row indexRow: Int) -> Row? {
        
        if !isValidIndexPath(at: indexSection, row: indexRow) {
            return nil
        }
        if !isUnwrapOpt(studentOfUnivers[indexSection].Students) {
            return nil
        }
        return studentOfUnivers[indexSection].Students![indexRow]
    }
    
    func createModel (type abstractType: String) -> Row? {
        
        /// get namespace
        let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String;
        
        /// get 'anyClass' with classname and namespace
        let clsAny: AnyClass? = NSClassFromString("\(namespace).\(abstractType)")
        
        guard let cls = clsAny else {
            return nil
        }
        
        let myItem = cls as! W5_AbsStudent.Type
        let instanceItem = myItem.init()
        
        return instanceItem
    }
    
    func tryParseToRow (any anyObject: AnyObject) -> Row? {
        let parsing = anyObject as? Row
        return parsing
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
        // If change university <=> move another section
        if fromIndexPath.section != to.section {
            
            // change university
            dump.stuUniversityName = studentOfUnivers[to.section].uName
            dump.stuUniversity = studentOfUnivers[to.section]
        }
        return true
    }
    
    
    func removeModel (at indexSection: Int, row indexRow: Int) -> Bool {
        
        if !isValidIndexPath(at: indexSection, row: indexRow) {
            return false
        }
        if !isUnwrapOpt(studentOfUnivers[indexSection].Students) {
            return false
        }
        studentOfUnivers[indexSection].Students!.remove(at: indexRow)
        return true
    }
    
    func insertModel (at indexSection: Int, row indexRow: Int, model: Row) -> Bool {
        
        if !isValidIndexPath(at: indexSection, row: indexRow) {
            return false
        }
        if !isUnwrapOpt(studentOfUnivers[indexSection].Students) {
            return false
        }
        studentOfUnivers[indexSection].Students!.insert(model, at: indexRow)
        return true
    }
    
    func updateModel (at indexSection: Int, row indexRow: Int, model: Row) -> Bool {
        
        if !isValidIndexPath(at: indexSection, row: indexRow) {
            return false
        }
        return true
    }
    
    func filterContentForSearchText(searchText: String, scope: String = "All") -> [Row] {
        
        var filteredEvent = [Row]()
        for univer in studentOfUnivers {
            if !isUnwrapOpt(univer.Students) {
                continue
            }
            let templateEvents = univer.Students!.filter { student in
                let categoryMatch = (scope == "All") || (univer.uName == scope)
                return  categoryMatch && ( student.stuName.lowercased().contains(searchText.lowercased()) ||
                    student.stuDescription.lowercased().contains(searchText.lowercased()) )
            }
            filteredEvent.append(contentsOf: templateEvents)
        }
        return filteredEvent
    }
    
    private func isUnwrapOpt (_ wrapObj: Any?) -> Bool {
        
        if wrapObj != nil {
            return true
        }
        return false
    }
    
    private func isValidIndexPath(at indexSection: Int, row indexRow: Int) -> Bool {
        
        if studentOfUnivers.count < indexSection {
            return false
        }
        else if isUnwrapOpt(studentOfUnivers[indexSection].Students) && studentOfUnivers[indexSection].Students!.count < indexRow {
            return false
        }
        return true
    }
}
