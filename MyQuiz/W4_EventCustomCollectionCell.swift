//
//  W4_EventCustomCollectionCell.swift
//  MyQuiz
//
//  Created by PhiTuocMacOS on 4/30/17.
//  Copyright © 2017 nguyenvanphituoc. All rights reserved.
//

import UIKit

class W4_EventCustomCollectionCell: UICollectionViewCell {
    
    
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbTime: UILabel!
    
    func setCellData( event : AbsEventModel ) {
        
        self.lbTitle.text = event.title;
        //        cell.btnStatus.setTitle("A", for: .normal);
        self.lbTime.text = event.time.rawValue
        
        switch event.status {
            
        case .Incoming:
            self.backgroundColor = UIColor.green
            break;
            
        default:
            self.backgroundColor = UIColor.red
            break;
        }
        
    }
    
}
