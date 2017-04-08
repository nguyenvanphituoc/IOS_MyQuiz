//
//  Quadratic.swift
//  MyQuiz
//
//  Created by Cntt13 on 4/8/17.
//  Copyright © 2017 nguyenvanphituoc. All rights reserved.
//

import UIKit


class Quadratic : UIViewController{
    
    @IBOutlet weak var inputNumberA: UITextField!
    @IBOutlet weak var inputNumberB: UITextField!
    @IBOutlet weak var inputNumberC: UITextField!
    @IBOutlet weak var btnExcute: UIButton!
    @IBOutlet weak var txtResult1: UITextField!
    @IBOutlet weak var txtResult2: UITextField!
    @IBOutlet weak var outpurExpression: UITextField!
    var validation : Bool = true ;
    
    @IBAction func InputNumberValidation(_ sender: UITextField) {
        validation = validation && validate(sender);
    }
    
    @IBAction func BtnExcute_onClick(_ sender: UIButton) {
        if !validation{
            print("expression error");
        }
        else {
            let numberA:Double = Double(inputNumberA.text!)!;
            let numberB:Double = Double(inputNumberB.text!)!;
            let numberC:Double = Double(inputNumberC.text!)!;
            
            var delta:Double = pow(numberB, 2) - 4 * numberA * numberC;
            
            if(delta >= 0){// trường hợp kết quả thuộc trường Q
                delta = sqrt(delta);
                let result1 = ( 1.0 * delta - numberB)/(2*numberA);
                let result2 = (-1.0 * delta - numberB)/(2*numberA);
                let expression:String = "(x - \(result1))(x - \(result2))";
                txtResult1.text = String(result1);
                txtResult2.text = String(result2);
                outpurExpression.text = expression;
            }
            
        }
    }
    
    func validate(_ sender: UITextField) -> Bool {
        if(sender.text?.isEmpty)!{
            print("empty number");
            return false;
        }
        return true;
    }
}
