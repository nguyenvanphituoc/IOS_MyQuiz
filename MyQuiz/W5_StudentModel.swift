//
//  W5_StudentModel.swift
//  MyQuiz
//
//  Created by PhiTuocMacOS on 5/6/17.
//  Copyright © 2017 nguyenvanphituoc. All rights reserved.
//

import UIKit

class W5_StudentModel: W5_AbsStudent {
    
    var image: UIImage
    
    required init() {
        
        self.image = UIImage()
        super.init()
    }
    
    
    required override init(name: String, description: String, gender: Bool, stuUniversityName: String, stuAge: Int8) {
        
        self.image = UIImage()
        super.init(name: name, description: description, gender: gender, stuUniversityName: stuUniversityName, stuAge: stuAge)
    }
    
    // copy constructor
    required init(_ source: W5_StudentModel) {
        
        self.image = source.image
        super.init(source)
    }
    
    // assignment operator
    
    static func += (dest: inout W5_StudentModel, source: W5_StudentModel) {
        
        dest += source
        dest.image = source.image
    }
    
    static func == (dest: W5_StudentModel, source: W5_StudentModel) -> Bool {
        var isEqual = true
        isEqual = isEqual && (dest == source)
        isEqual = isEqual && (dest.image === source.image)
        return isEqual
    }
    
    //
    override func sizeToFillWidthOfSize(_ selfSize: CGSize, _ size: CGSize) -> CGSize {
        
        var returnSize = size
        let aspectRatio = selfSize.width / selfSize.height
        
        returnSize.height = returnSize.width / aspectRatio
        
        if returnSize.height > size.height {
            returnSize.height = size.height
            returnSize.width = size.height * aspectRatio
        }
        
        return returnSize
    }
    
    
    override func parseDatetoString(day: Date) -> String  {
        
        
        let dateString = "Thu, 22 Oct 2015 07:45:17 +0000"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, dd MMM yyyy hh:mm:ss +zzzz"
        dateFormatter.locale = Locale.init(identifier: "en_GB")
        
        let dateObj = dateFormatter.date(from: dateString)
        
        dateFormatter.dateFormat = "MM-dd-yyyy hh:mm:ss"
        return (dateFormatter.string(from: dateObj!))
    }
    
}
