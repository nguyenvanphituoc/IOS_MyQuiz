//
//  BtnView.swift
//  MyQuiz
//
//  Created by Cntt34 on 4/12/17.
//  Copyright © 2017 nguyenvanphituoc. All rights reserved.
//

import UIKit
class BtnAnimation : UIViewController{
    
    @IBAction func Bounce(_ sender: UIButton) {
        let bounds = sender.bounds;
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: .curveEaseInOut, animations: {
            sender.bounds = CGRect(x : bounds.origin.x - 20, y : bounds.origin.y, width : bounds.size.width + 60, height : bounds.size.height)
        }) { (sucess : Bool) in
            if sucess{
                sender.bounds = bounds;
            }
        }
    }
}
