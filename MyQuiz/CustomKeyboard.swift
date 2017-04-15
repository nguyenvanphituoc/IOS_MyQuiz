//
//  CustomKeyboard.swift
//  MyQuiz
//
//  Created by PhiTuocMacOS on 4/15/17.
//  Copyright © 2017 nguyenvanphituoc. All rights reserved.
//

import UIKit

class CustomKeyboard: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBOutlet weak var buttonClear: UIButton!
    
    var numberClick : Bool = false;
    var actionClick : Bool = false;
    var clearClick : Bool = false;
    var deleteClick : Bool = false;
    var value : String = "";
    var action : ACTION = ACTION.NONE;
    enum ACTION {
        case NONE
        case MULTIPLICATION
        case DIVISION
        case PLUS
        case MINUS
        case BRACKET
        case CALCULATION
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.numberClick = false;
        super.init(coder: aDecoder)
        initSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    func initSubviews() {
        // standard initialization logic
//        let nib = UINib(nibName: "CustomKeyboard", bundle: nil)
//        nib.instantiate(withOwner: self, options: nil)
//        contentView.frame = bounds
//        addSubview(contentView)
            // custom initialization logic
    }
    
    @IBAction func NumberClick(_ sender: UIButton) {
        numberClick = true;
        actionClick = false;
        clearClick = false;
        deleteClick = false;
        switch sender.tag {
        case -1:
            value = String(".");
            break;
        case -2:
            value = String("-");
            break;
        default:
            value = String(sender.tag);
        }
    }
    
    @IBAction func ActionClick(_ sender: UIButton) {
        numberClick = false;
        actionClick = true;
        clearClick = false;
        deleteClick = false;
        switch sender.tag {
        case 110:
            action = ACTION.CALCULATION;
        case 109:
            action = ACTION.BRACKET;
        case 108:
            action = ACTION.MULTIPLICATION;
        case 107:
            action = ACTION.DIVISION;
        case 106:
            action = ACTION.PLUS;
        case 105:
            action = ACTION.MINUS;
        default:
            action = ACTION.NONE;
        }
    }
}
