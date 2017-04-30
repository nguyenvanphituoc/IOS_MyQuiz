//
//  EventCellDetail.swift
//  MyQuiz
//
//  Created by PhiTuocMacOS on 4/25/17.
//  Copyright © 2017 nguyenvanphituoc. All rights reserved.
//

import UIKit

class EventCellDetail: UIViewController {

    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbTime: UILabel!    
//    @IBOutlet weak var lbDayEvent: UILabel!
    @IBOutlet weak var btnStatus: UISwitch!
    @IBOutlet weak var txtDescription: UITextView!
    
    // need to edit
    private var event : AbsEventModel?
    private var row : Int?
    override func viewDidLoad() {
        
        super.viewDidLoad()
        makeBorder(sender: txtDescription)
        
//        lbDayEvent.text = dayEvent?.name.rawValue
        setDataDetail( event!)
      
                // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setData( dayEvent : DayMoDel, row : Int) {
        // receive data from table cell
        self.event = dayEvent.events[row]
        self.row = row
    }
    
    private func setDataDetail(_ myEvent : AbsEventModel) {
        // set data detail
        lbTitle.text = myEvent.title
        lbTime.text = myEvent.time.rawValue
        if myEvent.status == enumStatus.Completed {
            
            btnStatus.setOn(false, animated: true)
        }
        else{
            
            btnStatus.setOn(true, animated: true)
        }
        txtDescription.text = myEvent.description
    }
    
    func makeBorder( sender : UIView) {
        
        sender.layer.borderColor = UIColor(red : 0 / 255.0, green : 0 / 255.0, blue : 0.0 / 255.0, alpha : 1.0).cgColor
        sender.layer.borderWidth = 2.0
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
