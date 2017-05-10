//
//  W5_UniversityModel.swift
//  MyQuiz
//
//  Created by PhiTuocMacOS on 5/6/17.
//  Copyright © 2017 nguyenvanphituoc. All rights reserved.
//

import Foundation

class W5_UniversityModel {
    
    typealias StudentModel = W5_AbsStudent
    
    var uName: String = ""
    var uDescription: String = ""
    var Students: [StudentModel]?

    init() {
        
        self.uName = ""
        self.uDescription = ""
        self.Students = nil
    }
    
    init(name: String, description: String) {
        
        self.uName = name
        self.uDescription = description
        self.Students = nil
    }
    
    init(source: W5_UniversityModel) {
        
        self.uName = source.uName
        self.uDescription = source.uDescription
        if source.Students != nil {
            self.Students = []
            for student in source.Students! {
                self.Students!.append(StudentModel(student))
            }
        }
    }
    
}
