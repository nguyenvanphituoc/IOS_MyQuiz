//
//  W5_StuDetail.swift
//  MyQuiz
//
//  Created by PhiTuocMacOS on 5/6/17.
//  Copyright © 2017 nguyenvanphituoc. All rights reserved.
//

import UIKit

class W5_StuDetail: UITableViewController {
    
    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var pickUniver: UIPickerView!
    @IBOutlet weak var txtFullName: UITextField!
    @IBOutlet weak var txtAge: UITextField!
    @IBOutlet weak var rdBtnFemale: RadioButton!
    @IBOutlet weak var rdBtnMale: RadioButton!
    @IBOutlet weak var txtDescr: UITextView!
    @IBOutlet weak var btnSave: UIButton!
    // MARK: - Local variables
    var senderViewController: W5_AddNewStudent? = nil
    var pickerDataSource: [String]? = nil
    let numberPattern : String = "^[1-9]*$"
    var rdBtns: [RadioButton] = []
    var heightUnit : CGFloat = 0.0
    var activeText: UIView?
    // need to edit
    var student : W5_StudentController.Row?
    var studentCopy : W5_StudentController.Row?
    var row : Int?
    var mustAddNewItem: Int = -1 // isn't add func
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        //
        heightUnit = (tableView.frame.height - tableView.sectionHeaderHeight * 2 ) / 15
        // radiobutton handle
        rdBtns.append(contentsOf: [rdBtnMale, rdBtnFemale])
        // handle user's tap in screen
        // selector: the func will perform when observer trigger
        let dismiss: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.DismissKeyboard))
        view.addGestureRecognizer(dismiss)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardDidShow(notification:)), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        self.pickUniver.dataSource = self
        self.pickUniver.delegate   = self
        if senderViewController != nil {
            pickerDataSource = senderViewController?.getSectionArrayName()
        }
        if student! == studentCopy! {
            btnSave.isEnabled = false
        }
        else {
            btnSave.isEnabled = true
        }
        makeBorder(sender: txtDescr)
        
        setDataDetail( studentCopy!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.pickerViewAddTitle(pickUniver, at: 0, title: "University")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // must delected when back button pressed
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: self.view.window)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: self.view.window)
        
        if mustAddNewItem == 1 { // btn save clicked
            senderViewController!.isAdded(true)
        }
        else if mustAddNewItem == 0 {// not clicked
            senderViewController!.isAdded(false)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Action outlet
    
    @IBAction func rdBtnGender_onClick(_ sender: RadioButton) {
        
        for radioButton in rdBtns {
            radioButton.isSelected = false
        }
        sender.isSelected = !sender.isSelected
        sender.backgroundColor = UIColor.clear
        if rdBtnMale.isSelected {
            studentCopy?.stuGender = true
        }
        else {
            studentCopy?.stuGender = false
        }
        if student! == studentCopy! {
            btnSave.isEnabled = false
        }
        else {
            btnSave.isEnabled = true
        }
        
    }
    
    @IBAction func btnSave_OnClicked(_ sender: UIButton) {
        
        if sender.isEnabled && mustAddNewItem != -1 {
            //            isAddNewItem = true
            mustAddNewItem = 1
        }
        student! += studentCopy!
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func TextField_OnChanged(_ sender: UITextField) {
        
        let tag = sender.tag
        switch tag {
        case 100: // search
            break
        case 101: // name
            studentCopy?.stuName = sender.text!
            break
        case 102: // age
            if isCorrectNumber(sNumber : sender.text!, numberPattern : numberPattern) {
                studentCopy?.stuAge = Int8(sender.text!)!
            }
            else {
                sender.text = String(describing: studentCopy?.stuAge)
            }
            break
        default:
            break
        }
        if student! == studentCopy! {
            btnSave.isEnabled = false
        }
        else {
            btnSave.isEnabled = true
        }
        
    }
    
    // MARK: delegate
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    public func setData ( myStu : W5_StudentController.Row ) {
        
        //
        student = myStu
        self.studentCopy =  W5_StudentController.Row.init()
        self.studentCopy! += student!
    }
    
    private func setDataDetail(_ myStu : W5_StudentController.Row) {
        
        // set data detail
        txtFullName.text = myStu.stuName
        //        lbTime.text = myEvent.time.rawValue
        if myStu.stuGender! {
            
            rdBtnMale.isSelected = true
        }
        else {
            
            rdBtnFemale.isSelected = true
        }
        txtDescr.text = myStu.stuDescription
        txtAge.text = String(describing: myStu.stuAge)
        pickUniver.selectRow(findStudentInUniver(myStu), inComponent: 0, animated: true)
        if mustAddNewItem != -1 {
            pickUniver.selectedRow(inComponent: 0)
        }
    }
    
    // MARK: - TableView datasource
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
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
                return heightUnit * 2.5
            }
            else if indexPath.row == 2 {
                return heightUnit * 1.0
            }
            else if indexPath.row == 1 {
                return heightUnit * 5.5
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
    // MARK: - Private func
    
    func findStudentInUniver (_ myStu: W5_StudentController.Row) -> Int {
        for i in 0..<pickerDataSource!.count {
            let s = pickerDataSource![i]
            if s == myStu.stuUniversityName {
                return i
            }
        }
        return -1
    }
    
    func isCorrectNumber( sNumber : String, numberPattern : String) -> Bool {
        
        let regex = NSPredicate(format:"SELF MATCHES %@", numberPattern);
        return regex.evaluate(with: sNumber)
    }
    
    
    private func makeBorder( sender : UIView) {
        
        sender.layer.borderColor = UIColor(red : 0 / 255.0, green : 144 / 255.0, blue : 128 / 255.0, alpha : 1.0).cgColor
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
            self.student! += self.studentCopy!
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            print("Handle Cancel Logic here")
        }))
        
        present(refreshAlert, animated: true, completion: nil)
    }
    
    func keyboardDidShow(notification: NSNotification) {
        
        // get action from user
        let userInfo = notification.userInfo!
        // get action with user key
        let keyboardSize: CGSize = (userInfo[UIKeyboardFrameBeginUserInfoKey]! as AnyObject).cgRectValue.size
        let offset: CGSize = (userInfo[UIKeyboardFrameEndUserInfoKey]! as AnyObject).cgRectValue.size
        // make screen vertical scroll above for the first keyboard show
        if keyboardSize.height == offset.height {
            if self.view.frame.origin.y == 0 {
                UIView.animate(withDuration: 0.1, animations: { () -> Void in
                    self.view.frame.origin.y -= keyboardSize.height
                })
            }
        } else { // return for after keyboard show
            UIView.animate(withDuration: 0.1, animations: { () -> Void in
                self.view.frame.origin.y += keyboardSize.height - offset.height
            })
        }
        
        let navigationBarHeight = self.navigationController?.navigationBar.frame.height
        let headerHeight = tableView.sectionHeaderHeight
        let contentInsets = UIEdgeInsets(top: 0.0 + navigationBarHeight! + keyboardSize.height + headerHeight, left: 0.0, bottom: 0.0, right: 0.0)
        self.tableView.contentInset = contentInsets
        self.tableView.scrollIndicatorInsets = contentInsets
    }
    
    func keyboardWillBeHidden(notification: NSNotification) {
        
        let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue
        self.view.frame.origin.y += (keyboardSize?.height)!
        
        let navigationBarHeight = self.navigationController?.navigationBar.frame.height
        let contentInsets = UIEdgeInsets(top: navigationBarHeight! + 15, left: 0.0, bottom: 0.0, right: 0.0)
        //        let contentInsets = UIEdgeInsets.zero
        self.tableView.contentInset = contentInsets
        self.tableView.scrollIndicatorInsets = contentInsets
    }
    
    func DismissKeyboard(){
        view.endEditing(true) // that to call the first responder seem the textshould return i do
    }
}

extension W5_StuDetail: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        studentCopy?.stuUniversityName = pickerDataSource![row]
        if student! == studentCopy! {
            btnSave.isEnabled = false
        }
        else {
            btnSave.isEnabled = true
        }
    }
    
}

extension W5_StuDetail: UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return pickerDataSource!.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return pickerDataSource![row]
    }
    
}

extension W5_StuDetail: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeText = textField
        self.tableView.isScrollEnabled = true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        activeText = nil
        self.tableView.isScrollEnabled = false
    }
}

extension W5_StuDetail: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        activeText = textView
        self.tableView.isScrollEnabled = true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        activeText = nil
        self.tableView.isScrollEnabled = false
    }
    
    func textViewDidChange(_ textView: UITextView) {
        
        studentCopy?.stuDescription = txtDescr.text
        if student! == studentCopy! {
            btnSave.isEnabled = false
        }
        else {
            btnSave.isEnabled = true
        }
        
    }
    
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        txtDescr.resignFirstResponder()
    }
}
