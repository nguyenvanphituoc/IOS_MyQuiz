//
//  Calculator.swift
//  MyQuiz
//
//  Created by Cntt13 on 4/15/17.
//  Copyright © 2017 nguyenvanphituoc. All rights reserved.
//

//        var a: [String] = []
//        var b = [String]()
//
//        var x: Double = Double("1")!
//        var y = Double("1")!
//
//        var z = 0
//        var t = 1.0
//
//
//        let b: [String]
//        var c: [String: String] = ["a": "valye", "b": "value"] // dictionary
//        a.append("bhasfbshf")
//        a.append("sfsdfd")
//        let x = (a: 1, b: "2", c: "a string")
//        x.

import UIKit

class Calculator : UIViewController{
    
    let numberPattern : String = "[-]?(\\d*)(\\.(\\d*))?"
    var isNumberClick : Bool = false;
    var isActionClick : Bool = false;
    var isClearClick : Bool = false;
    var isDeleteClick : Bool = false;
    var value : String = "";
 
    @IBOutlet weak var lbNumber: UILabel!
    
    @IBOutlet weak var lbResult: UILabel!
    
    var action : enumACTION = enumACTION.NONE;

    
    enum enumACTION {
        case NONE
        case MULTIPLICATION
        case DIVISION
        case PLUS
        case MINUS
        case BRACKET
        case CALCULATION
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func ActionClick(_ sender: UIButton) {
        isNumberClick = false;
        isActionClick = true;
        isClearClick = false;
        isDeleteClick = false;
        switch sender.tag {
        case 110:
            action = enumACTION.CALCULATION;
        case 109:
            action = enumACTION.BRACKET;
        case 108:
            action = enumACTION.MULTIPLICATION;
        case 107:
            action = enumACTION.DIVISION;
        case 106:
            action = enumACTION.PLUS;
        case 105:
            action = enumACTION.MINUS;
        default:
            action = enumACTION.NONE;
        }
        
//        let nav: UINavigationController
//        let _ = nav.popViewController(animated: true)
    }

    @IBAction func BtnNumber_onClick(_ sender: UIButton) {
//        BtnAnimation(sender);
        isNumberClick = true;
        isActionClick = false;
        isClearClick = false;
        isDeleteClick = false;
        
        var correctNumber : Bool = false;
        let text = lbNumber.text!
        switch sender.tag {
        case -1:
            value = String(".");
            break;
        case -2:
            value = String("-");
            break;
        default:
            value = String(sender.tag);
            break;
        }
        correctNumber = isCorrectNumber(sNumber: (text + value), numberPattern: numberPattern)
        if(correctNumber){
            lbNumber.text! += value;
        }
    }
    
    
    
//    private func BtnAnimation (_ sender : UIButton)->Void{
//        UIView.animate(withDuration: 0.5, delay: 0, options: .transitionCurlUp, animations: {
//            
//        }, completion: nil)
//    }
    
    func isCorrectNumber( sNumber : String, numberPattern : String) -> Bool{
        let regex = NSPredicate(format:"SELF MATCHES %@", numberPattern);
         return regex.evaluate(with: sNumber)
    }
    
    func alert(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
}
