//
//  W5_InitialData.swift
//  MyQuiz
//
//  Created by PhiTuocMacOS on 5/7/17.
//  Copyright © 2017 nguyenvanphituoc. All rights reserved.
//

import UIKit

enum enumRandomType: String {
    case name = "name"
    case gender = "gender"
    case university = "university"
}

class W5_InitialData {
    
    typealias Section = W5_UniversityModel
    typealias Row = W5_AbsStudent
    typealias InstanceOfRow = W5_StudentModel
    
    static fileprivate let studentLastName = ["Nguyễn", "Trần", "Lê", "Phạm", "Hoàng", "Phan", "Võ", "Đặng", "Bùi", "Đỗ", "Hồ", "Ngô", "Dương", "Lý", "Huỳnh", "Vũ"]
    
    static fileprivate let studentFirstName = ["Linh", "Vân Anh", "Anh Thư", "Anh", "Bảo Ngọc", "Phi Tước", "Thuỳ Dương", "Quang Hiển", "Như Yến", "Thanh Ngân", "Hồnh Anh", "Thuỳ Linh", "Quang Dương", "Minh Lý", "An Khang", "Hiếu"]
    
    static fileprivate let studentUniversity = ["Hanoi University of Science and Technology", "National University of Civil Engineering", "National Economics University", "Hanoi University", "University of Technical Education Ho Chi Minh City", "Ho Chi Minh City University of Law", "Ho Chi Minh City University of Foreign Languages and Information Technology", "Ho Chi Minh University of Technology", "Ho Chi Minh City University of Natural Sciences", "Hue Conservatoire", "Hue Economics University", "Vietnam National University, Ho Chi Minh City", "Ho Chi Minh City University of Medicine and Pharmacy", "Ho Chi Minh City University of Social Sciences and Humanities", "Vietnam National University, Ho Chi Minh City", "Posts and Telecommunications Institute of Technology"]
    
    static func initialData () -> [Section] {
        
        var universities: [Section] = []
        while universities.count < 10 {
            let university = randomUniversity()
            var hasContain = false
            for uni in universities {
                if uni.uName == university.uName {
                    hasContain = true
                    break
                }
            }
            if !hasContain {
                universities.append(university)
            }
        }
        return universities
    }
    
    static func randomUniversity () -> Section {
        
        let university = Section()
        university.uName = random(.university) as! String
        university.uDescription = "None"
        university.Students = []
        while university.Students!.count < 10 {
            
            university.Students!.append(randomStudentWithUniver( university.uName))
        }
        return university
    }
    
    static func randomStudentWithUniver (_ univer: String) -> Row {
        
        let student = InstanceOfRow()
        student.stuName = random(enumRandomType.name) as! String
        student.stuGender = random(.gender) as? Bool
        student.stuUniversityName = univer
        student.stuDescription = "None"
        if student.stuGender! {
            student.image = UIImage(named: "theBoy")!
        }
        else {
            student.image = UIImage(named: "theGirl")!
        }

        return student
    }
    
    static func randomStudent () -> Row {
        
        let student = InstanceOfRow()
        student.stuName = random(enumRandomType.name) as! String
        student.stuGender = random(.gender) as? Bool
        student.stuUniversityName = random(.university) as! String
        student.stuDescription = "None"
        
        if student.stuGender! {
            student.image = UIImage(named: "theBoy")!
        }
        else {
            student.image = UIImage(named: "theGirl")!
        }
        return student
    }
    
    static func random ( _ type: enumRandomType) -> Any? {
        
        switch type {
        case .name:
            var randomNumber = arc4random() % UInt32(studentLastName.count)
            var fullname = studentLastName[Int(randomNumber)]
            randomNumber = arc4random() % UInt32(studentFirstName.count)
            fullname += " \(studentFirstName[Int(randomNumber)])"
            return fullname
        case .gender:
            return (arc4random() % 10) >= 5 ? true : false
        case .university:
            let randomNumber = arc4random() % UInt32(studentUniversity.count)
            return studentUniversity[Int(randomNumber)]
        }
        
    }
}
