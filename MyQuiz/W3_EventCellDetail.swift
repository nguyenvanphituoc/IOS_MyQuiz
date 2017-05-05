//
//  EventCellDetail.swift
//  MyQuiz
//
//  Created by PhiTuocMacOS on 4/25/17.
//  Copyright © 2017 nguyenvanphituoc. All rights reserved.
//

import UIKit

class EventCellDetail: UITableViewController {
    
    @IBOutlet weak var pickTime: UIPickerView!
    @IBOutlet weak var btnStatus: UISwitch!
    @IBOutlet weak var txtDescription: UITextView!
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var btnSave: UIButton!
    
    let pickerDataSource = EventModel.enumWeekToArray();
    var heightUnit : CGFloat = 0.0
    
    // need to edit
    var event : AbsEventModel?
    var eventCopy : AbsEventModel?
    var row : Int?
    var isClickedSave = false
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let dismiss: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(EventCellDetail.DismissKeyboard))
        view.addGestureRecognizer(dismiss)
        
        // add these two lines
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(sender:)), name:NSNotification.Name.UIKeyboardWillShow, object: self.view.window)
        NotificationCenter.default.addObserver(self, selector: #selector(EventCellDetail.keyboardWillHide(sender:)), name:NSNotification.Name.UIKeyboardWillHide, object: self.view.window)
        
        makeBorder(sender: txtDescription)
        
        self.pickTime.dataSource = self
        self.pickTime.delegate   = self
        
        heightUnit = (tableView.frame.height - 25 * 2 ) / 15
        if equalModel(left: event!, right: eventCopy!) {
            btnSave.isEnabled = false
        }
        else {
            btnSave.isEnabled = true
        }
        setDataDetail( eventCopy!)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        self.pickerViewAddTitle(pickTime, at: 0, title: "DAY")
     }
    
    override func viewWillDisappear(_ animated: Bool) {
        // must delected when back button pressed
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: self.view.window)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: self.view.window)

        if !isClickedSave && !equalModel(left: event!, right: eventCopy!) {
//            showWarningAlert()
        }
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func txtTitle_onChanged(_ sender: UITextField) {
        
        eventCopy?.title = txtTitle.text!
        if equalModel(left: event!, right: eventCopy!) { btnSave.isEnabled = false }
        else { btnSave.isEnabled = true }
    }
    
    
    
    @IBAction func btnStatus_onClicked(_ sender: UISwitch) {
        
        if btnStatus.isOn { eventCopy?.status = enumStatus.Incoming }
        else { eventCopy?.status = enumStatus.Completed }
        if equalModel(left: event!, right: eventCopy!) { btnSave.isEnabled = false }
        else { btnSave.isEnabled = true }
    }
    
    @IBAction func btnSave_onClicked(_ sender: UIButton) {
        
        //target: should learn about generics operator
        if sender.isEnabled {
            isClickedSave = true
        }
        assignmentModel(left: &event!, right: eventCopy!)
        self.navigationController?.popViewController(animated: true)
    }
    
    func equalModel (left: AbsEventModel, right: AbsEventModel) -> Bool {
        
        var isEqual = true
        isEqual = isEqual && (left.title == right.title)
        isEqual = isEqual && (left.mDescription == right.mDescription)
        isEqual = isEqual && (left.time == right.time)
        isEqual = isEqual && (left.status == right.status)
        return isEqual
    }

    
    func assignmentModel (left: inout AbsEventModel, right: AbsEventModel) {
        
        left.title = (right.title)
        left.mDescription = (right.mDescription)
        left.time = (right.time)
        left.status = (right.status)
    }
    
    public func setData( dayEvent : DayMoDel, row : Int) {
        
        // receive data from table cell
        self.event = dayEvent.events[row]
        self.eventCopy = event?.copy(with: nil) as? AbsEventModel
        self.row = row
    }
    
    private func setDataDetail(_ myEvent : AbsEventModel) {
        
        // set data detail
        txtTitle.text = myEvent.title
        //        lbTime.text = myEvent.time.rawValue
        if myEvent.status == enumStatus.Completed {
            
            btnStatus.setOn(false, animated: true)
        }
        else{
            
            btnStatus.setOn(true, animated: true)
        }
        txtDescription.text = myEvent.mDescription
        pickTime.selectRow( EventModel.findDayInWeek(data: pickerDataSource, dayInWeek: myEvent.time), inComponent: 0, animated: true)
    }
    
    private func makeBorder( sender : UIView) {
        
        sender.layer.borderColor = UIColor(red : 0 / 255.0, green : 0 / 255.0, blue : 0.0 / 255.0, alpha : 1.0).cgColor
        sender.layer.borderWidth = 2.0
    }

    private func pickerViewAddTitle (_ pickerView: UIPickerView, at component: Int, title: String) {
        
        let labelWidth = pickerView.frame.width / CGFloat(pickerView.numberOfComponents)
        let label: UILabel = UILabel(frame: CGRect(x: pickerView.frame.origin.x + labelWidth * CGFloat(component), y: 0, width: labelWidth, height: heightUnit * 1.0))
        
        label.text = title
        label.textAlignment = .center
        pickerView.addSubview(label)

    }
    
    private func showWarningAlert() {
        
        let refreshAlert = UIAlertController(title: "Save", message: "Do you want save data changed.", preferredStyle: UIAlertControllerStyle.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            self.assignmentModel(left: &self.event!, right: self.eventCopy!)
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            print("Handle Cancel Logic here")
        }))
        
        present(refreshAlert, animated: true, completion: nil)
    }
    
    func keyboardWillShow(sender: NSNotification) {
        let userInfo = sender.userInfo!
        
        let keyboardSize: CGSize = (userInfo[UIKeyboardFrameBeginUserInfoKey]! as AnyObject).cgRectValue.size
        let offset: CGSize = (userInfo[UIKeyboardFrameEndUserInfoKey]! as AnyObject).cgRectValue.size
        
        if keyboardSize.height == offset.height {
            if self.view.frame.origin.y == 0 {
                UIView.animate(withDuration: 0.1, animations: { () -> Void in
                    self.view.frame.origin.y -= keyboardSize.height
                })
            }
        } else {
            UIView.animate(withDuration: 0.1, animations: { () -> Void in
                self.view.frame.origin.y += keyboardSize.height - offset.height
            })
        }
        print(self.view.frame.origin.y)
    }
    
    func keyboardWillHide(sender: NSNotification) {
        let userInfo = sender.userInfo!
        let keyboardSize: CGSize = (userInfo[UIKeyboardFrameBeginUserInfoKey]! as AnyObject).cgRectValue.size
        self.view.frame.origin.y += keyboardSize.height
    }
    
    func DismissKeyboard(){
        view.endEditing(true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                return heightUnit * 1.0
            }
            else if indexPath.row == 1 {
                return heightUnit * 3.0
            }
        }
        else  if indexPath.section == 1 {
            if indexPath.row == 0 {
                return heightUnit * 1.0
            }
            else if indexPath.row == 2 {
                return heightUnit * 1.0
            }
            else if indexPath.row == 1 {
                return heightUnit * 7.0
            }
        }
        return heightUnit * 0.0
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
// MARK: PickerViewDelegate when change time
extension EventCellDetail: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        eventCopy?.time = pickerDataSource[row]
        if equalModel(left: event!, right: eventCopy!) {
            btnSave.isEnabled = false
        }
        else {
            btnSave.isEnabled = true
        }
    }
}
// MARK: textview description delegate
extension EventCellDetail: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        
        eventCopy?.mDescription = txtDescription.text
        if equalModel(left: event!, right: eventCopy!) {
            btnSave.isEnabled = false
        }
        else {
            btnSave.isEnabled = true
        }
    }
}







