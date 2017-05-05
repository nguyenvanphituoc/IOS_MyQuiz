//
//  AbsController.swift
//  MyQuiz
//
//  Created by PhiTuocMacOS on 4/30/17.
//  Copyright © 2017 nguyenvanphituoc. All rights reserved.
//

import Foundation


enum MyErrorHandle: Error {
    
    case unwrapOptional
}

protocol AbsController {
    
    associatedtype Section
    associatedtype Row
    
    func getNumberOfSection() -> Int
    
    func getNumberOfRow(at indexSection: Int) -> Int
    
    func getSectionName(at indexSection: Int) -> String
    
    func getSection(at indexSection: Int) -> Section?
    
    func getModel(at indexSection: Int, row indexRow: Int) -> Row?
    
    func createModel (type abstractType: String) -> Row?
    
    func moveModel(moveRowAt fromIndexPath: IndexPath, to: IndexPath) -> Bool

    func removeModel (at indexSection: Int, row indexRow: Int) -> Bool
    
    func insertModel (at indexSection: Int, row indexRow: Int, model: Row) -> Bool
    
    func updateModel (at indexSection: Int, row indexRow: Int, model: Row) -> Bool
}
