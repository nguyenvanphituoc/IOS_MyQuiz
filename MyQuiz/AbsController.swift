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
    associatedtype Handle
    associatedtype Model
    
    func removeModel (at indexSection: Int, row indexRow: Int) -> Bool
    func insertModel (at indexSection: Int, row indexRow: Int, model: Model) -> Bool
    func updateModel (at indexSection: Int, row indexRow: Int) -> Bool
}
