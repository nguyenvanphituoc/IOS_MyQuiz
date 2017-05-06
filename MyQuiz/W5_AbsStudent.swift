//
//  W5_AbsStudent.swift
//  MyQuiz
//
//  Created by PhiTuocMacOS on 5/6/17.
//  Copyright © 2017 nguyenvanphituoc. All rights reserved.
//

import UIKit

infix operator +=

class W5_AbsStudent: W5_IFStudent
{
    typealias Universitymodel = W5_UniversityModel
    
    var stuName: String
    var stuDescription: String
    var stuAge: Int8
    var stuUniversityName: String
    var stuUniversity: Universitymodel?
    
    required init() {
        
        self.stuName = ""
        self.stuDescription = ""
        self.stuAge = 18
        self.stuUniversityName = ""
        self.stuUniversity = nil
    }
    
    init(name: String, description: String, age : Int8, stuUniversityName: String) {
        
        self.stuName = ""
        self.stuDescription = ""
        self.stuAge = 18
        self.stuUniversityName = ""
        self.stuUniversity = nil
    }
    
    // copy constructor
    init(_ source: W5_AbsStudent) {

        self.stuName = source.stuName;
        self.stuDescription = source.stuDescription;
        self.stuAge = source.stuAge
        self.stuUniversityName = source.stuUniversityName
        if source.stuUniversity != nil {
            self.stuUniversity = Universitymodel(source: source.stuUniversity!)
        }
    }
    
    // assignment operator
    static func += (dest: inout W5_AbsStudent, source: W5_AbsStudent) {
        
        dest.stuName = source.stuName;
        dest.stuDescription = source.stuDescription;
        dest.stuAge = source.stuAge
        dest.stuUniversityName = source.stuUniversityName
        if source.stuUniversity != nil {
            dest.stuUniversity = Universitymodel(source: source.stuUniversity!)
        }
    }
    
    func parseDatetoString( day : Date) -> String { return "" }
    
    func sizeToFillWidthOfSize(_ selfSiza: CGSize, _ size:CGSize) -> CGSize { return CGSize() }
}
