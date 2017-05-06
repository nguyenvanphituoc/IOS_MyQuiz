//
//  W5_AbsController.swift
//  MyQuiz
//
//  Created by PhiTuocMacOS on 5/6/17.
//  Copyright © 2017 nguyenvanphituoc. All rights reserved.
//

import Foundation

protocol W5_AbsController {
    
    associatedtype Section
    associatedtype Row
    
    func getNumberOfSection() -> Int
    
    func getNumberOfRow(at indexSection: Int) -> Int
    
    func getSectionName(at indexSection: Int) -> String
    
    func getSection(at indexSection: Int) -> Section?
    
    func getModel(at indexSection: Int, row indexRow: Int) -> Row?
    
    func createModel (type abstractType: String) -> Row?
    
    func tryParseToRow (any anyClass: AnyObject) -> Row?
    
    func moveModel(moveRowAt fromIndexPath: IndexPath, to: IndexPath) -> Bool
    
    func removeModel (at indexSection: Int, row indexRow: Int) -> Bool
    
    func insertModel (at indexSection: Int, row indexRow: Int, model: Row) -> Bool
    
    func updateModel (at indexSection: Int, row indexRow: Int, model: Row) -> Bool
    
    func filterContentForSearchText(searchText: String, scope: String) -> [Row]
}
