//
//  Testing.swift
//  MyQuiz
//
//  Created by Cntt34 on 5/3/17.
//  Copyright © 2017 nguyenvanphituoc. All rights reserved.
//

import UIKit

class Testing: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var txtTesting: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardDidShow(notification:)), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.txtTesting = nil
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.txtTesting = textField
    }
    
    func keyboardDidShow(notification: NSNotification) {
        if let activeField = self.txtTesting, let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
            self.scrollView.contentInset = contentInsets
            self.scrollView.scrollIndicatorInsets = contentInsets
            var aRect = self.view.frame
            aRect.size.height -= keyboardSize.size.height
            if (!aRect.contains(activeField.frame.origin)) {
                self.scrollView.scrollRectToVisible(activeField.frame, animated: true)
            }
        }
    }
    
    func keyboardWillBeHidden(notification: NSNotification) {
        let contentInsets = UIEdgeInsets.zero
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
    }
    
}
