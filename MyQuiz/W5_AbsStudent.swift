//
//  W5_AbsStudent.swift
//  MyQuiz
//
//  Created by PhiTuocMacOS on 5/6/17.
//  Copyright © 2017 nguyenvanphituoc. All rights reserved.
//

import UIKit

infix operator +=
infix operator ==

class W5_AbsStudent: W5_IFStudent
{
    typealias Universitymodel = W5_UniversityModel
    
    var stuName: String
    var stuDescription: String
    var stuGender: Bool?
    var stuAge: Int8
    var stuUniversityName: String
    var University: Universitymodel?
    
    required init() {
        
        self.stuName = ""
        self.stuDescription = ""
        self.stuGender = nil
        self.stuUniversityName = ""
        self.stuAge = 18
        self.University = nil
    }
    
    init(name: String, description: String, gender : Bool, stuUniversityName: String, stuAge: Int8) {
        
        self.stuName = name
        self.stuDescription = description
        self.stuGender = gender
        self.stuUniversityName = stuUniversityName
        self.stuAge = stuAge
        self.University = nil
    }
    
    // copy constructor
    init(_ source: W5_AbsStudent) {
        
        self.stuName = source.stuName;
        self.stuDescription = source.stuDescription;
        self.stuGender = source.stuGender
        self.stuUniversityName = source.stuUniversityName
        self.stuAge = source.stuAge
        if source.University != nil {
            self.University = Universitymodel(source: source.University!)
        }
    }
    
    // assignment operator
    static func += (dest: inout W5_AbsStudent, source: W5_AbsStudent) {
        
        dest.stuName = source.stuName;
        dest.stuDescription = source.stuDescription;
        dest.stuGender = source.stuGender
        dest.stuUniversityName = source.stuUniversityName
        dest.stuAge = source.stuAge
        if source.University != nil {
            dest.University = Universitymodel(source: source.University!)
        }
    }
    
    static func == (dest: W5_AbsStudent, source: W5_AbsStudent) -> Bool {
        var isEqual = true
        isEqual = isEqual && (dest.stuName == source.stuName)
        isEqual = isEqual && (dest.stuDescription == source.stuDescription)
        isEqual = isEqual && (dest.stuGender == source.stuGender)
        isEqual = isEqual && (dest.stuUniversityName == source.stuUniversityName)
        isEqual = isEqual && (dest.stuAge == source.stuAge)
        return isEqual
    }
    
    
    func parseDatetoString( day : Date) -> String { return "" }
    
    func sizeToFillWidthOfSize(_ selfSiza: CGSize, _ size:CGSize) -> CGSize { return CGSize() }
}
