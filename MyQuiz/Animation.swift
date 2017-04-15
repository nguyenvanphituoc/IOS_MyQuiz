//
//  Animation.swift
//  MyQuiz
//
//  Created by Cntt34 on 4/12/17.
//  Copyright © 2017 nguyenvanphituoc. All rights reserved.
//

import UIKit
class Animation : UIViewController {
    
    
    @IBOutlet weak var btn1: NSLayoutConstraint!
    @IBOutlet weak var btn2: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        btn1.constant -= view.bounds.height;
        btn2.constant -= view.bounds.height;
    }
    var animationPerformence = false
    override func viewDidAppear(_ animated: Bool) {
        if !animationPerformence {
            animationPerformence = true;
        UIView.animate(withDuration: 1.5, delay: 0, options: .curveEaseOut, animations: {
            self.btn1.constant += self.view.bounds.height - 100;
            self.view.layoutIfNeeded();
        }, completion: nil)
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseIn, animations: {
            self.btn2.constant += self.view.bounds.height + 100;
            self.view.layoutIfNeeded();
        }, completion: nil)
        }
    }
}
