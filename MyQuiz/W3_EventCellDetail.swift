//
//  EventCellDetail.swift
//  MyQuiz
//
//  Created by PhiTuocMacOS on 4/25/17.
//  Copyright © 2017 nguyenvanphituoc. All rights reserved.
//

import UIKit

class EventCellDetail: UITableViewController {
    
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var pickTime: UIPickerView!
    @IBOutlet weak var btnStatus: UISwitch!
    @IBOutlet weak var txtDescription: UITextView!
    @IBOutlet weak var txtTitle: UITextField!
    
    let pickerDataSource = EventModel.enumWeekToArray();
    
    
    // need to edit
    private var event : AbsEventModel?
    private var row : Int?
    override func viewDidLoad() {
        
        super.viewDidLoad()
        makeBorder(sender: txtDescription)
        
        self.pickTime.dataSource = self
        self.pickTime.delegate   = self
        //        lbDayEvent.text = dayEvent?.name.rawValue
        setDataDetail( event!)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let labelWidth = pickTime.frame.width / CGFloat(pickTime.numberOfComponents)
        let label: UILabel = UILabel(frame: CGRect(x: pickTime.frame.origin.x + labelWidth * CGFloat(0), y: 0, width: labelWidth, height: 20))
        
        label.text = "Day"
        label.textAlignment = .center
        pickTime.addSubview(label)
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
        lbTitle.text = "Title: "
        txtTitle.text = myEvent.title
        //        lbTime.text = myEvent.time.rawValue
        if myEvent.status == enumStatus.Completed {
            
            btnStatus.setOn(false, animated: true)
        }
        else{
            
            btnStatus.setOn(true, animated: true)
        }
        txtDescription.text = myEvent.description
        pickTime.selectRow( findDayInWeek(dayInWeek: myEvent.time), inComponent: 0, animated: true)
    }
    
    func makeBorder( sender : UIView) {
        
        sender.layer.borderColor = UIColor(red : 0 / 255.0, green : 0 / 255.0, blue : 0.0 / 255.0, alpha : 1.0).cgColor
        sender.layer.borderWidth = 2.0
    }
    
    private func findDayInWeek ( dayInWeek: enumDayInWeek) -> Int {
        
        for day in 0..<pickerDataSource.count {
            if dayInWeek == pickerDataSource[day] {
                return day
            }
        }
        return -1
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
// MARK: PickerViewData
extension EventCellDetail: UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row].rawValue
    }
}
// MARK: PickerViewDelegate
extension EventCellDetail: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //        pickTime.selectedRow(inComponent: component)
    }
}











