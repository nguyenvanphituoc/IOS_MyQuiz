//
//  W5_StuTableCustomCell.swift
//  MyQuiz
//
//  Created by PhiTuocMacOS on 5/6/17.
//  Copyright © 2017 nguyenvanphituoc. All rights reserved.
//

import UIKit

class W5_StuTableCustomCell: UITableViewCell {

    typealias Row = W5_AbsStudent
    
    @IBOutlet weak var imgStu: UIImageView!
    @IBOutlet weak var lbStuUniver: UILabel!
    @IBOutlet weak var lbStuName: UILabel!
    @IBOutlet weak var lbStuGender: UILabel!
    @IBOutlet weak var lbStuDescr: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setCellData (_ student: Row) {
        
        self.lbStuUniver.text = student.stuUniversityName
        self.lbStuName.text = student.stuName
        self.lbStuDescr.text = String(student.stuAge)
        if student.stuGender! {
            lbStuGender.text = "👱 Nam"
        }
        else {
            lbStuGender.text = "🙎🏼 Nữ"
        }
        guard student is W5_StudentModel else {
            return
        }
        if student.stuGender! {
           self.imgStu.image = UIImage(named: "theBoy")
        }
        else {
            self.imgStu.image = UIImage(named: "theGirl")
        }

    }
    
}
