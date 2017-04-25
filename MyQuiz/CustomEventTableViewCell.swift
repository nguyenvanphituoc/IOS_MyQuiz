//
//  CustomEventCellTableViewCell.swift
//  MyQuiz
//
//  Created by Cntt13 on 4/22/17.
//  Copyright © 2017 nguyenvanphituoc. All rights reserved.
//

import UIKit

class CustomEventTableViewCell: UITableViewCell {

    
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var txtDescription: UITextField!
    @IBOutlet weak var btnStatus: UIButton!
    @IBOutlet weak var lbTime: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setCellData( event : AbsEventModel ) {
        
        self.lbTitle.text = event.title;
        self.txtDescription.text = event.description;
        
        //        cell.btnStatus.setTitle("A", for: .normal);
        self.lbTime.text = event.time.rawValue
        
        switch event.status {
            
        case .Incoming:
            
            self.btnStatus.setTitle("🛑", for: .normal)
            break;
        default:
            
            self.btnStatus.setTitle("✅", for: .normal)
            break;
        }

    }
    
}
