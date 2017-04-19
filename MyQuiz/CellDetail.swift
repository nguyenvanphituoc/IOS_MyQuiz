//
//  CellDetail.swift
//  MyQuiz
//
//  Created by Cntt34 on 4/19/17.
//  Copyright © 2017 nguyenvanphituoc. All rights reserved.
//

import UIKit

class CellDetail: UIViewController {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        guard var product : Product = self.value(forKey: "celldetail") as! Product
        else {
            
        }
        img.image = product.image;
        lbTitle.text = product.title;
        lbDescription.text = product.description
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
