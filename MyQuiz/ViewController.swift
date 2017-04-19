//
//  ViewController.swift
//  MyQuiz
//
//  Created by Cntt34 on 4/5/17.
//  Copyright © 2017 nguyenvanphituoc. All rights reserved.
//

import UIKit
   class ViewController: UIViewController {

    @IBOutlet weak var lbQuiz: UILabel!
    @IBOutlet weak var btnAnswerA: UIButton!
    @IBOutlet weak var btnAnswerB: UIButton!
    @IBOutlet weak var btnAnswerC: UIButton!
    @IBOutlet weak var btnAnswerD: UIButton!
    @IBOutlet weak var btnNextQuiz: UIButton!
    @IBOutlet weak var lbAnswer: UILabel!
    var correctAnswer = Int();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        RandomQuiz();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func BtnNextQuiz_onClick(_ sender: Any) {
         RandomQuiz();
    }
    func RandomQuiz(){
        var randomNumber = arc4random() % 5;
        randomNumber+=1 ;
        switch randomNumber {
        case 1:
            lbQuiz.text = "Can you click answer button D?"
            btnAnswerA.setTitle("A", for: UIControlState.normal);
            btnAnswerB.setTitle("B", for: UIControlState.normal);
            btnAnswerC.setTitle("C", for: UIControlState.normal);
            btnAnswerD.setTitle("D", for: UIControlState.normal);
            correctAnswer = 4;
            break;
        case 2:
            lbQuiz.text = "Can you click answer button A?"
            btnAnswerA.setTitle("A", for: UIControlState.normal);
            btnAnswerB.setTitle("B", for: UIControlState.normal);
            btnAnswerC.setTitle("C", for: UIControlState.normal);
            btnAnswerD.setTitle("D", for: UIControlState.normal);
            correctAnswer = 1;
            break;
        case 3:
            lbQuiz.text = "Can you click answer button C?"
            btnAnswerA.setTitle("A", for: UIControlState.normal);
            btnAnswerB.setTitle("B", for: UIControlState.normal);
            btnAnswerC.setTitle("C", for: UIControlState.normal);
            btnAnswerD.setTitle("D", for: UIControlState.normal);
            correctAnswer = 3;
            break;
        case 4:
            lbQuiz.text = "Can you click answer button B?"
            btnAnswerA.setTitle("A", for: UIControlState.normal);
            btnAnswerB.setTitle("B", for: UIControlState.normal);
            btnAnswerC.setTitle("C", for: UIControlState.normal);
            btnAnswerD.setTitle("D", for: UIControlState.normal);
            correctAnswer = 2;
            break;
        case 5:
            lbQuiz.text = "Can you remind me all button were clicked?"
            btnAnswerA.setTitle("D A C B", for: UIControlState.normal);
            btnAnswerB.setTitle("A C D B", for: UIControlState.normal);
            btnAnswerC.setTitle("D C B A", for: UIControlState.normal);
            btnAnswerD.setTitle("D A B C", for: UIControlState.normal);
            correctAnswer = 1;
            break;

        default:
            
            break;
        }
    }
    
    @IBAction func BtnAnswerA_onClick(_ sender: Any) {
        if(correctAnswer == 1){
            lbAnswer.text = "You are correct!";
        }
        else{
            lbAnswer.text = "You are not correct!";
        }
    }

    @IBAction func BtnAnswerB_onClick(_ sender: Any) {
        if(correctAnswer == 2){
            
            lbAnswer.text = "You are correct!";
        }
        else{
            
            lbAnswer.text = "You are not correct!";
        }
    }
    
    @IBAction func BtnAnswerC_onClick(_ sender: Any) {
        if(correctAnswer == 3){
            
            lbAnswer.text = "You are correct!";
        }
        else{
            
            lbAnswer.text = "You are not correct!";
        }

    }
    
    @IBAction func BtnAnswerD_onClick(_ sender: Any) {
        if(correctAnswer == 4){
           
            lbAnswer.text = "You are correct!";
        }
        else{
           
            lbAnswer.text = "You are not correct!";
        }

    }
//    override func target(forAction action: Selector, withSender sender: Any?) -> Any? {
//        errSecNoDefaultKeychain
//        kCIImageAutoAdjustFeatures
//        false
//        setValue(Any?, forUndefinedKey: <#T##String#>)
//    }
}

