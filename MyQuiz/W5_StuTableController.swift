//
//  W5_TableViewController.swift
//  MyQuiz
//
//  Created by PhiTuocMacOS on 5/6/17.
//  Copyright © 2017 nguyenvanphituoc. All rights reserved.
//

import UIKit

private let reuseIdentifier = "studentCell"

class W5_StuTableController: UITableViewController {
    
    var dataStudentController: W5_StudentController?
    var shouldAnimaCell: [Bool]?
    // create new bar search controller
    let searchController = UISearchController(searchResultsController: nil)
    // now let's do search feature
    var filterResultStudents: [W5_StudentController.Row] = []
    var newItem: Any? // use to creat nevarvent
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // initial data
        dataStudentController = W5_StudentController(W5_InitialData.initialData())
        shouldAnimaCell = [Bool](repeating: false, count: dataStudentController!.getNumberAllRow())
        // search added in headerview
        searchController.searchResultsUpdater = self as UISearchResultsUpdating
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        // add scope for search
        searchController.searchBar.scopeButtonTitles = reloadScopeBar()
        searchController.searchBar.delegate = self
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        if searchController.isActive && searchController.searchBar.text != "" {
            return 1
        }

        guard let dump = dataStudentController else {
            return 0
        }
        
        return dump.getNumberOfSection()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if searchController.isActive && searchController.searchBar.text != "" {
            return filterResultStudents.count
        }

        guard let dump = dataStudentController else {
            return 0
        }
        return dump.getNumberOfRow(at: section)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if searchController.isActive && searchController.searchBar.text != "" {
            return "Search result"
        }
        guard let dump = dataStudentController else {
            return ""
        }
        return dump.getSectionName(at: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! W5_StuTableCustomCell
        
        makeBorder(sender: cell)
        var model: W5_StudentController.Row
        // Configure the cell...
        guard let dump = dataStudentController else {
            return cell
        }
        if searchController.isActive && searchController.searchBar.text != "" {
            model = filterResultStudents[indexPath.row]
        }
        else {
            model = dump.getModel(at: indexPath.section, row: indexPath.row)!
        }
        cell.setCellData(model)
        
        return cell
    }
    
    // MARK: - 	Animate to the Cell
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        var exactlyRow = 0
        for i in 0..<indexPath.section {
            exactlyRow += dataStudentController!.getNumberOfRow(at: i)
        }
        exactlyRow += indexPath.row
        if !shouldAnimaCell![exactlyRow] {
                    cell.alpha = 0
//            let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -300, 10, 0)
//            cell.layer.transform = rotationTransform
            UIView.animate(withDuration: 0.5) {
                    cell.alpha = 1
//                cell.layer.transform = CATransform3DIdentity
            }
            shouldAnimaCell![exactlyRow] = true
        }
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    // MARK: - Delegate
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            if  dataStudentController!.removeModel(at: indexPath.section, row: indexPath.row) {
                // Delete the row from the data source
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
        guard let dump = dataStudentController else {
            return
        }
        if dump.moveModel(moveRowAt: fromIndexPath, to: to) {
            tableView.reloadSections(IndexSet([to.section]), with: .middle)
        }
     }
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
     // MARK: - Navigation
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        switch identifier {
        case "studentDetail":
            return true
        case "studentAdd":
            
            newItem = dataStudentController?.createModel(type: "W5_StudentModel")
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
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
        
        switch segue.identifier! {
        case "studentDetail":
            
            let viewDetail = segue.destination as! W5_StuDetail
            let indexPath = tableView.indexPath(for: (sender as! W5_StuTableCustomCell?)!)
            guard let dumpIndexPath = indexPath else {
                return
                
            }
            var data: W5_StudentController.Row
//            if isSearch && txtSearch.text != "" {
//                data = filterResultEvents[(dumpIndexPath.row)]
//            }
            // Configure the cell...
            if searchController.isActive && searchController.searchBar.text != "" {
                data = filterResultStudents[dumpIndexPath.row]
            }
            else {
                data = (dataStudentController?.getModel(at: dumpIndexPath.section, row: dumpIndexPath.row)!)!
            }            
            viewDetail.setData(myStu: data)
            viewDetail.senderViewController = self
            viewDetail.mustAddNewItem = -1;
            break
        case "studentAdd":
            
            // get view detail may be displayed data cell
            let viewDetail = segue.destination as! W5_StuDetail;
            viewDetail.setData(myStu: newItem as! W5_AbsStudent)
            viewDetail.senderViewController = self
            viewDetail.mustAddNewItem = 0;
            break
        default:
            break
        }
     }
    
    // MARK: - Private func
    
    func alert(message: String, title: String = "") {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }

    
    func makeBorder( sender : UIView) {
        
        let border = CALayer()
        let width = CGFloat(2.0)
        border.borderColor = UIColor.darkGray.cgColor
        border.frame = CGRect(x: 0, y: sender.frame.size.height - width, width:  sender.frame.size.width, height: sender.frame.size.height)
        
        border.borderWidth = width
        sender.layer.addSublayer(border)
        sender.layer.masksToBounds = true
    }
    
    func reloadScopeBar () -> [String]{
    
            var allScope: [String] = []
            allScope.append("All")
//            for i in 0..<5 {
//                let university = dataStudentController?.getSection(at: i)
//                guard let dump = university else {
//                    continue
//                }
//                allScope.append(dump.uName)
//            }
            return allScope
    }
    
}

extension W5_StuTableController: W5_AddNewStudent {
    func isAdded(_ added: Bool) {
        if (added) {
            if let tmpItem = dataStudentController?.tryParseToRow(any: newItem as AnyObject){
                    // detect section
                    var numberOfSection = (dataStudentController?.getNumberOfSection())!
                    for i in 0..<numberOfSection {
                        
                        let section = dataStudentController?.getSection(at: i)
                        if section?.uName == tmpItem.stuUniversityName {
                            numberOfSection = i
                            break
                        }
                        
                    }
                    let numberOfRow = (dataStudentController?.getNumberOfRow(at: numberOfSection))!
                    let _ = dataStudentController?.insertModel(at: numberOfSection, row: numberOfRow, model: tmpItem)
                    tableView.reloadSections(IndexSet([numberOfSection]), with: .left)
                    self.tableView.scrollToRow(at: IndexPath(row: numberOfRow, section: numberOfSection), at: .middle, animated: true)
                    alert(message: "new item added")
                newItem = nil
            }
        }
    }
    
    func getSectionArrayName () -> [String] {
        
        var arrayName: [String] = []
        for i in 0..<dataStudentController!.getNumberOfSection() {
            let section = dataStudentController!.getSection(at: i)
            arrayName.append(section!.uName)
        }
        return arrayName
    }
}

extension W5_StuTableController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterResultStudents.removeAll()
        guard let dump =  dataStudentController?.filterContentForSearchText(searchText: searchBar.text!, scope: scope) else {
            return
        }
        filterResultStudents = dump
        tableView.reloadData()
    }
}

extension W5_StuTableController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterResultStudents.removeAll()
        guard let dump =  dataStudentController?.filterContentForSearchText(searchText: searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope]) else {
            return
        }
        filterResultStudents = dump
        tableView.reloadData()
    }
}
