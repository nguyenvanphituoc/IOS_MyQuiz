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
    @IBOutlet weak var txtDescription: UITextView!
    
    func setCellData( event : AbsEventModel ) {
        
        self.lbTitle.text = event.title;
        //        cell.btnStatus.setTitle("A", for: .normal);
        self.lbTime.text = event.time.rawValue
        self.txtDescription.text = event.description
        self.txtDescription.centerVertically()
        switch event.status {
            
        case .Incoming:
            self.backgroundColor = UIColor.red
            break;
            
        default:
            self.backgroundColor = UIColor.green
            break;
        }
        
    }
    
}

extension UITextView {
    
    func centerVertically() {
        let fittingSize = CGSize(width: bounds.width, height: CGFloat.greatestFiniteMagnitude)
        let size = sizeThatFits(fittingSize)
        let topOffset = (bounds.size.height - size.height * zoomScale) / 2
        let positiveTopOffset = max(1, topOffset)
        contentOffset.y = -positiveTopOffset
    }
    
}
