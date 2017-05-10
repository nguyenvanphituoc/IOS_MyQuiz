//
//  W5_IFStudent.swift
//  MyQuiz
//
//  Created by PhiTuocMacOS on 5/6/17.
//  Copyright © 2017 nguyenvanphituoc. All rights reserved.
//

import UIKit

protocol W5_IFStudent {

    func parseDatetoString( day : Date) -> String
    func sizeToFillWidthOfSize(_ selfSiza: CGSize, _ size:CGSize) -> CGSize
}
