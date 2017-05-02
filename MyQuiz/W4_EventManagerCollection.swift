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
    
    //datasource
    var dataHandleController : EventController?
    
    fileprivate let itemsPerRow: CGFloat = 3
    //1
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        collectionView?.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
    
    
    // MARK: - Navigation
    
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
                let section = dataHandleController?.getSection(at: dumpIndexPath.section)
                viewDetail.setData(dayEvent: section!, row: dumpIndexPath.row)
                break;
                
            default:
                break;
            }
        }
        
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        // #warning Incomplete implementation, return the number of sections
        guard let dump = dataHandleController else {
            return 0
            
        }
        return dump.getNumberOfSection();
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // #warning Incomplete implementation, return the number of items
        guard let dump = dataHandleController else {
            return 0
            
        }
        return dump.getNumberOfRow(at: section);
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionElementKindSectionHeader:
            let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "collectionHeader", for: indexPath) as! W4_EventmanagerCollectionReuse
            cell.lbTitle.text = (dataHandleController?.getSection(at: indexPath.section))?.name.rawValue
            return cell
        default:
            assert(false, "Unexpected element kind")
        }
        
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! W4_EventCustomCollectionCell
        
        // Configure the cell
        cell.setCellData(event: (dataHandleController?.getModel(at: indexPath.section, row: indexPath.row))!)
        
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
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
            
            if  (dataHandleController?.removeModel(at: indexPath.section, row: indexPath.row))! {
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
        
        var _ = dataHandleController?.moveModel(moveRowAt: sourceIndexPath, to: destinationIndexPath)
        collectionView.reloadItems(at: [destinationIndexPath])
        collectionView.reloadSections(IndexSet([sourceIndexPath.section]))
    }
    
}

extension W4_EventManagerCollection : UICollectionViewDelegateFlowLayout {
    //1
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // New code
        if indexPath == largePhotoIndexPath {
            let data = dataHandleController?.getModel(at: indexPath.section, row: indexPath.row)
            let cellData = collectionView.cellForItem(at: indexPath)!
            let selfSize = cellData.bounds.size
            var size = collectionView.bounds.size
            size.height -= topLayoutGuide.length
            size.height -= (sectionInsets.top + sectionInsets.right * 2)
            size.width -= (sectionInsets.left + sectionInsets.right)
            return data!.sizeToFillWidthOfSize(selfSize, size)
        }
        //2
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem * 0.75)
    }
    
    //3
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    // 4
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}
