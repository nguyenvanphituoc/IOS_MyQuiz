//
//  W4_EventManagerCollection.swift
//  MyQuiz
//
//  Created by PhiTuocMacOS on 4/30/17.
//  Copyright © 2017 nguyenvanphituoc. All rights reserved.
//

import UIKit

private let reuseIdentifier = "collectionCell"

class W4_EventManagerCollection: UICollectionViewController {
    
    // MARK: variables and constant
    //datasource
    var dataHandleController : EventController?
    var newItem: Any? // use to creat new event
    var isSearch: Bool = false
    
    fileprivate let itemsPerRow: CGFloat = 3 // display items in row
    //1 observer property to get indexpath of cell zoom in
    var largePhotoIndexPath: IndexPath? {
        didSet {
            //2
            var indexPaths = [IndexPath]()
            if let largePhotoIndexPath = largePhotoIndexPath {
                indexPaths.append(largePhotoIndexPath as IndexPath)
            }
            if let oldValue = oldValue {
                indexPaths.append(oldValue as IndexPath)
            }
            //3
            collectionView?.performBatchUpdates({
                self.collectionView?.reloadItems(at: indexPaths)
            }) { completed in
                //4
                if let largePhotoIndexPath = self.largePhotoIndexPath {
                    self.collectionView?.scrollToItem(
                        at: largePhotoIndexPath as IndexPath,
                        at: .centeredVertically,
                        animated: true)
                }
            }
        }
    }
    
    var statusBar: Int?
    
    fileprivate let sectionInsets = UIEdgeInsets(top: 25.0, left: 10.0, bottom: 25.0, right: 10.0)
    // now let's do search feature
    var filterResultEvents: [EventController.Row] = []
    @IBOutlet weak var txtSearch: UITextField!
    // MARK: Life cycle Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Register cell classes
        //        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        // Do any additional setup after loading the view.
        //initial datasource
        dataHandleController = EventController(DayMoDel.EventsInWeek())
        // navigation bar button
        navigationItem.rightBarButtonItem = editButtonItem
        //
        txtSearch.text?.removeAll()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if let tmpItem = dataHandleController?.tryParseToRow(any: newItem as AnyObject){
            if tmpItem.time != enumDayInWeek.NotADay {
                // detect section
                var numberOfSection = (dataHandleController?.getNumberOfSection())!
                for i in 0..<numberOfSection {
                    
                    let section = dataHandleController?.getSection(at: i)
                    if section?.name == tmpItem.time {
                        numberOfSection = i
                        break
                    }
                    
                }
                let numberOfRow = (dataHandleController?.getNumberOfRow(at: numberOfSection))!
                let _ = dataHandleController?.insertModel(at: numberOfSection, row: numberOfRow, model: tmpItem)
                collectionView?.reloadSections(IndexSet([numberOfSection]))
                self.collectionView?.scrollToItem(
                    at: IndexPath(row: numberOfRow, section: numberOfSection),
                    at: .centeredVertically,
                    animated: true)
                alert(message: "new item added")
            }
            newItem = nil
        }
        collectionView?.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Outlet Action
    
    // the action binding when text changing, we need set search is enable and
    // get result to filter
    // reload data to make view call again all func delegate and datasource
    @IBAction func txtSearch_onChanged(_ sender: UITextField) {
        
        isSearch = true
        filterResultEvents.removeAll()
        filterResultEvents = (dataHandleController?.filterContentForSearchText(searchText: txtSearch.text!))!
        collectionView?.reloadData()
    }
    
    // MARK: - Navigation
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        
        super.setEditing(editing, animated: animated)
        if editing {
            
            let questionController = UIAlertController(title: "What u wanna do?", message: nil, preferredStyle: .alert)
            questionController.addAction(UIAlertAction(title: "Details event", style: .default, handler: { (action:UIAlertAction) -> Void in
                
                self.statusBar = 2
                
            }))
            questionController.addAction(UIAlertAction(title: "Delete event", style: .default, handler: {
                
                (action:UIAlertAction!) -> Void in
                
                self.statusBar = 1
                
            }))
            present(questionController, animated: true, completion: nil)
        }
        else {
            statusBar = -2
        }
    }
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        switch identifier {
            
        case "eventEdit":
            return true
        case "eventAdd":
            
            newItem = dataHandleController?.createModel(type: "EventModel")
            var tmp = newItem as! EventController.Row
            tmp.time = EventModel.enumWeekToArray()[getDayOfWeek() - 1]
            // get view detail may be displayed data cell
            guard newItem != nil else {
                alert(message: "Something error when create new Item")
                return false
            }
            return true
        default:
            return false
        }
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if let identifier = segue.identifier {
            
            switch identifier {
                
            case "eventEdit":
                
                // get view detail may be displayed data cell
                let viewDetail = segue.destination as! EventCellDetail;
                // get and send data to view
                let indexPath = collectionView?.indexPath(for: (sender as! W4_EventCustomCollectionCell?)!)
                guard let dumpIndexPath = indexPath else {
                    return
                    
                }
                var data: EventController.Row
                if isSearch && txtSearch.text != "" {
                    data = filterResultEvents[(dumpIndexPath.row)]
                }
                else {
                    data = (dataHandleController?.getModel(at: dumpIndexPath.section, row: dumpIndexPath.row)!)!
                }
                viewDetail.setData(myEvent: data)
                viewDetail.mustAddNewItem = -1;
                break;
                
            case "eventAdd":
                // get view detail may be displayed data cell
                let viewDetail = segue.destination as! EventCellDetail;
                viewDetail.setData(myEvent: newItem as! AbsEventModel)
                viewDetail.mustAddNewItem = 0;
                break;
            default:
                break;
            }
            
            
        }
        
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        // #warning Incomplete implementation, return the number of sections
        if isSearch && txtSearch.text != "" {
            return 1
        }
        
        guard let dump = dataHandleController else {
            return 0
            
        }
        return dump.getNumberOfSection();
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // #warning Incomplete implementation, return the number of items
        if isSearch && txtSearch.text != "" {
            return filterResultEvents.count
        }
        
        guard let dump = dataHandleController else {
            return 0
            
        }
        return dump.getNumberOfRow(at: section);
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionElementKindSectionHeader:
            let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "collectionHeader", for: indexPath) as! W4_EventmanagerCollectionReuse
            var title: String
            if isSearch && txtSearch.text != "" {
                title = "Search result"
            }
            else {
                title = ((dataHandleController?.getSection(at: indexPath.section))?.name.rawValue)!
            }
            cell.lbTitle.text = title
            return cell
        default:
            assert(false, "Unexpected element kind")
        }
        
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! W4_EventCustomCollectionCell
        var model: EventController.Row
        if isSearch && txtSearch.text != "" {
            model = filterResultEvents[indexPath.row]
        }
        else {
            model = (dataHandleController?.getModel(at: indexPath.section, row: indexPath.row))!
        }
        // Configure the cell
        cell.setCellData(event: model)
        
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        makeBorder(sender: collectionView.cellForItem(at: indexPath)!)
        return true
    }
    
    
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        
        //details
        if statusBar == 2 {
            return true
        }
        // delete
        if statusBar == 1 {
            
            if !isSearch {
                if  (dataHandleController?.removeModel(at: indexPath.section, row:  indexPath.row))! {
                    collectionView.deleteItems(at: [indexPath])
                    collectionView.reloadSections(IndexSet([indexPath.section]))
                }
            }
            else {
                filterResultEvents.remove(at: indexPath.row)
                collectionView.deleteItems(at: [indexPath])
                collectionView.reloadSections(IndexSet([indexPath.section]))
            }
            return false
        }
        
        
        largePhotoIndexPath = largePhotoIndexPath == indexPath ? nil : indexPath
        return false
    }
    /*
     override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
     
     }
     */
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
    override func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        if !isSearch || txtSearch.text == "" {
            var _ = dataHandleController?.moveModel(moveRowAt: sourceIndexPath, to: destinationIndexPath)
            collectionView.reloadItems(at: [destinationIndexPath])
            collectionView.reloadSections(IndexSet([sourceIndexPath.section]))
        }
    }
    
    // MARK: - my supported Func
    
    private func alert(message: String, title: String = "") {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    private func getDayOfWeek() -> Int {
        let today = Date()
        let myCalendar = Calendar(identifier: .gregorian)
        let weekDay = myCalendar.component(.weekday, from: today)
        return weekDay
    }
    
    private func makeBorder( sender : UIView) {
        
        sender.layer.borderColor = UIColor(red : 0 / 255.0, green : 0 / 255.0, blue : 0.0 / 255.0, alpha : 1.0).cgColor
        sender.layer.borderWidth = 2.0
    }
    
    @objc private  func DismissKeyboard(){
        txtSearch.endEditing(true)
    }
    
    
}

// Mark: - Extension

extension W4_EventManagerCollection : UITextFieldDelegate {

    // search function when click return in keyboar we need completed search
    // and return data
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // return the status previous keyboard delegate
        txtSearch.resignFirstResponder()
        isSearch = false
        return true
    }
}

extension W4_EventManagerCollection : UICollectionViewDelegateFlowLayout {
    //1
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // New code for zoom item at indexpath
        if indexPath == largePhotoIndexPath {
            let data = dataHandleController?.getModel(at: indexPath.section, row: indexPath.row)
            let cellData = collectionView.cellForItem(at: indexPath) as! W4_EventCustomCollectionCell
            // reload cell data, I reload because I need to set textDiscription center,
            // neither you not need that
            cellData.setCellData(event: data!)
            //
            let selfSize = cellData.bounds.size
            var size = collectionView.bounds.size
            // resize collection view make more space for selfSize
            size.height -= topLayoutGuide.length
            size.height -= (sectionInsets.top + sectionInsets.right * 2)
            size.width -= (sectionInsets.left + sectionInsets.right)
            // make size of cell biggest
            return data!.sizeToFillWidthOfSize(selfSize, size)
        }
        //2 if not zoom item, will display only 3 item per row
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem * 0.75)
    }
    
    //3 padding between item in section
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    // 4 minimum space between header footer with cell
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}
