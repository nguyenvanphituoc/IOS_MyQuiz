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
    // status off keyboard
    var isNumberClick : Bool = false;
    var isActionClick : Bool = false;
    var isPercentClick : Bool = false;
    
    @IBOutlet weak var lbNumber: UILabel!
    
    @IBOutlet weak var lbResult: UILabel!
    
    var holderBtnAction : UIButton? = nil
    
    var holdAction  : enumOPERATOR = enumOPERATOR.NONE; //holding current action
    var olderAction : enumOPERATOR = enumOPERATOR.NONE;// holding old action
    
    var numberA : Double = 0 // result operand1
    var numberB : Double = 0 // option operand2
    var chooseNumberA : Bool = true
    
    enum enumOPERATOR {
        
        case NONE
        case MULTIPLICATION
        case DIVISION
        case PLUS
        case MINUS
        case CALCULATION
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    //that func to perform reset click
    @IBAction func BtnClear_onClick(_ sender: UIButton) {
        BtnAnimation(sender);
        lbNumber.text = "" ;
        lbResult.text = "" ;
        
        numberA = 0;
        numberB = 0;
        
        isNumberClick = false ;
        isActionClick = false ;
        isPercentClick = false;
//        isDeleteClick = false ;
        chooseNumberA = true;
        
        holdAction = enumOPERATOR.NONE;
        if holderBtnAction != nil {
            
            BtnClearBoder(holderBtnAction!)
        }
    }
    
    //that func to perform multiple, division, plus.... action click
    @IBAction func BtnAction_onClick(_ sender: UIButton) {
        
        //set animation
        BtnAnimation(sender);
        //clear button clicked previous
        if holderBtnAction != nil {
            
            BtnClearBoder(holderBtnAction!)
        }
        // set current button was clicked
        holderBtnAction = sender
        // set border for button clicked
        BtnHoldingBorder(sender);
        // hold older action
        olderAction = holdAction
        // get number
        let s : String = lbNumber.text == "" ? "0.0" : lbNumber.text!
        // insert number to operandB
        chooseNumberA ? ( numberA = Double(s)! ) : ( numberB = Double(s)! )
        // the first time insert number to operandA
        chooseNumberA = false;
        
        switch sender.tag {
            
            case 108:
                holdAction = enumOPERATOR.MULTIPLICATION;
            
            case 107:
                holdAction = enumOPERATOR.DIVISION;
            
            case 106:
                holdAction = enumOPERATOR.PLUS;
            
            case 105:
                holdAction = enumOPERATOR.MINUS;
            
            default:
                // action equal clicked
                BtnClearBoder(sender)
                CalculatingAction(holdAction)
                //update status for keyboard
                isNumberClick = false;
                isActionClick = true;
                isPercentClick = false;
                return
        }
        
        //same operator can quickly calculating
        if(isNumberClick && OperatorPriority(olderAction) == OperatorPriority(holdAction)){
            CalculatingAction(olderAction)
        }
        //update status for keyboard
        isNumberClick = false;
        isActionClick = true;
        isPercentClick = false;
//        isDeleteClick = false;
    }
    
    //that func to perform number action click
    @IBAction func BtnNumber_onClick(_ sender: UIButton) {
        
        BtnAnimation(sender);
        // check correct number
        var correctNumber : Bool = false;
        if isActionClick {
            lbNumber.text = ""
        }
        //get number from lbNumber
        var text = lbNumber.text!
        var value : String = "";
        switch sender.tag {
            case -1:
                value = String(".");
                break;
            
            case -2:
                if(text == "") {
                    
                    text = "0.0"
                }
                let number = Double(text)! * -1.0;
                lbNumber.text = String(number)
            return

            
            case -3:
                // if is percent
                if(text == "") {
                    
                    text = "0.0"
                }
                if(!isPercentClick){
                    let number = Double(text)! / 100 * 1.0;
                    lbNumber.text = String(number)
                }
                else {
                    let number = Double(text)! * 100 * 1.0;
                    lbNumber.text = String(number)
                }
                isPercentClick =  !isPercentClick;
                return
            default:
                value = String(sender.tag);
                break;
        }
        correctNumber = isCorrectNumber(sNumber: (text + value), numberPattern: numberPattern)
        if(correctNumber){
            
            lbNumber.text! += value;
        }
        else{
            
            alert(message: "You input valid number", title: "Error Number")
        }
        
        //update status for keyboard
        isNumberClick = true;
        isActionClick = false;
//        isDeleteClick = false;
    }
    
    // that func to perform result to operandA
    func CalculatingAction(_ action : enumOPERATOR){
        
        numberA = CalculatingNumber(action, a: numberA, b: numberB)
        lbResult.text = String(numberA)
    }
    
    //that func to perform calculating two double number
    func CalculatingNumber(_ action : enumOPERATOR, a : Double, b : Double) -> Double {
        
        switch action {
            
        case enumOPERATOR.MULTIPLICATION:
            return a * b
            
        case enumOPERATOR.DIVISION:
            return a / b
            
        case enumOPERATOR.PLUS:
            return a + b
            
        case enumOPERATOR.MINUS:
            return a - b
            
        default:
            if(chooseNumberA){
                
                return a
            }
            else {
                
                return b
            }
        }
    }

    //func get priority of operator
    private func OperatorPriority(_ myOperator : enumOPERATOR) -> Int {
        
        switch myOperator {
            
        case enumOPERATOR.MULTIPLICATION, enumOPERATOR.DIVISION:
            return 10
            
        case enumOPERATOR.PLUS, enumOPERATOR.MINUS:
            return 5
            
        default:
            return 0
        }

    }
    
    //func clear border
    private func BtnClearBoder(_ sender : UIButton) -> Void {
        
        
        sender.layer.borderWidth = 0.0
        sender.layer.borderColor = sender.layer.backgroundColor
    }
    
    //func perform simple border
    private func BtnHoldingBorder(_ sender : UIButton) -> Void {
        
        sender.layer.borderWidth = 2.0
        sender.layer.borderColor =
            UIColor(red : 0 / 255.0, green : 0 / 255.0, blue : 255.0 / 255.0, alpha : 1.0).cgColor
    }
    
    //that func to perform with sender button transform after click
    private func BtnAnimation (_ sender : UIButton) -> Void {
        
        var rotationAndPerspectiveTransform : CATransform3D = CATransform3DIdentity;
        rotationAndPerspectiveTransform.m34 = 1.0 / -500;
        rotationAndPerspectiveTransform = CATransform3DMakeTranslation(3.0, 3.0, 1.0)
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
            
            sender.layer.transform = rotationAndPerspectiveTransform;
        }) { (success) in
            if success {
                
                 sender.transform = CGAffineTransform.identity
            }
        }
    }
    
    //that func to perform is correct number with pattern "[-]?(\\d*)(\\.(\\d*))?"
    func isCorrectNumber( sNumber : String, numberPattern : String) -> Bool {
        
        let regex = NSPredicate(format:"SELF MATCHES %@", numberPattern);
        return regex.evaluate(with: sNumber)
    }
    
     //that func to perform message box to user
    func alert(message: String, title: String = "") {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
}
