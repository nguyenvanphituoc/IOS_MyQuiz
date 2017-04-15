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
    
    func Quadratic(){
    
    }
    
    
    @IBAction func InputNumberValidation(_ sender: UITextField) {
        initialValue(sender);
        validation = validation && validateNumber(sender)
    }
    
    
    @IBAction func BtnResetAll_onClick(_ sender: UIButton) {
        resetAll();
    }
    
    @IBAction func BtnExcute_onClick(_ sender: UIButton) {
        resetResult();
        initialValue(inputNumberA);
        initialValue(inputNumberB);
        initialValue(inputNumberC);
        if !validation{
            print("expression error");
            alert(message: "expression error", title: "error");
        }
        else {
            
            let numberA:Double = Double(inputNumberA.text!)!;
            let numberB:Double = Double(inputNumberB.text!)!;
            let numberC:Double = Double(inputNumberC.text!)!;
            
            if( numberA == 0 && numberB == 0 && numberC == 0 ){
                txtResult1.text = String("Inf");
                txtResult2.text = String("Inf");
                return;
            }
            if( numberA == 0 && numberB == 0 && numberC != 0 ){
                txtResult1.text = String("Nan");
                txtResult2.text = String("Nan");
                return;
            }

            if( numberA == 0 && numberB != 0 && numberC != 0 ){
                let result2 = -1.0 * numberC / numberB;
                txtResult2.text = String(result2);
                displayOutputExpression(String(""), String(result2));
                return;
            }
            let delta:Double = pow(numberB, 2) - 4 * numberA * numberC;            
            if(delta >= 0){// trường hợp kết quả thuộc trường Q
                let delta = sqrt(delta);
                let result1 = ( 1.0 * delta - numberB)/(2*numberA);
                let result2 = (-1.0 * delta - numberB)/(2*numberA);
                txtResult1.text = String(result1);
                txtResult2.text = String(result2);
                displayOutputExpression(String(result1), String(result2));
            }
            else{// trường hợp kết quả thuộc trường i
                let delta = sqrt(-delta);
                let result1 = "(\(delta)i - \(numberB))/\(2*numberA)";
                let result2 = "(\(-delta)i - \(numberB))/\(2*numberA)";
                txtResult1.text = String(result1);
                txtResult2.text = String(result2);
                displayOutputExpression(String(result1), String(result2));
            }
        }
    }
    
    func resetAll(){
        inputNumberA.text = nil;
        inputNumberB.text = nil;
        inputNumberC.text = nil;
        resetResult();
    }
    
    func resetResult(){
        txtResult1.text = nil;
        txtResult2.text = nil;
        outpurExpression.text = nil;
    }

    
    func initialValue(_ sender: UITextField){
        if(sender.text?.isEmpty)!{
            sender.text = String(0);
        }
    }
    
    func validateNumber(_ sender: UITextField) -> Bool {
        if((sender.text?.isEmpty)! ||  (Int(sender.text!) == nil)){
            alert(message: "\(sender.placeholder!) error ", title: "error");
            return false;
        }
        return true;
    }
    
    func displayOutputExpression( _ result1:String, _ result2:String){
        if(result1.isEmpty)
        {
            let expression:String = "(x - \(result2))";
            outpurExpression.text = expression;
            return;
        }
        let expression:String = "(x - \(result1))(x - \(result2))";
        outpurExpression.text = expression;
    }
    
    func alert(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
