//
//  MyProductTableViewCTC.swift
//  MyQuiz
//
//  Created by Cntt34 on 4/19/17.
//  Copyright © 2017 nguyenvanphituoc. All rights reserved.
//

import UIKit

class MyEventManagerTableView : UITableViewController {
    
    //datasource
    var dataHandleController : EventController?
    //    lazy var dayEvents : [DayMoDel] { <- What is called, how that map the func not a create data
    // When you call self.dayEvents, this function will be called. OK?
    // Jump into DayMoDel.EventsInWeak() <- viet sai chinh ta roi chu'
    // hhe, I will load data in viewDidLoad() right?
    //First, check the below function
    //        return DayMoDel.EventsInWeak()
    //    }
    
    // MARK: - Table view data source
    override func viewDidLoad() {
        
        //register custom cell
//        tableView.register(CustomEventTableViewCell.self, forCellReuseIdentifier: "customCellA")
        //initial datasource
        dataHandleController = EventController(DayMoDel.EventsInWeek())
        //edit button
        navigationItem.rightBarButtonItem = editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        // #warning Incomplete implementation, return the number of sections
        guard let dump = dataHandleController else {
            return 0
            
        }
        return dump.getNumberOfSection();
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        // When you do this dayEvents[] => the function in line 19 will be called because dayEvents is a "computed property"
        // You must change dayEvents to become a "stored property" or lazy var
        // okay, now I'm understand, tks ^^ love ya <3, my mistake when I watching video tutorial
        // Ok, just remember: Do not use computed property too much. It will impact your application's performance
        guard let dump = dataHandleController else {
            return ""
            
        }
        return dump.getSectionName(at: section);
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // #warning Incomplete implementation, return the number of rows
        guard let dump = dataHandleController else {
            return 0
            
        }
        return dump.getNumberOfRow(at: section);
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! CustomEventTableViewCell
        // Configure the cell...
        guard let dump = dataHandleController else {
            return cell
            
        }
        let event = dump.getModel(at: indexPath.section, row: indexPath.row);
        guard let dumpEvent = event else {
            return cell
            
        }
        cell.setCellData(event: dumpEvent)
        
        return cell
        
    }
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    /*
     override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
     let delAction = UITableViewRowAction(style: .default, title: "Delete") { (action, indexPath) in
     
     self.dayEvents[indexPath.section].events.remove(at: indexPath.row);
     self.tableView.deleteRows(at: [indexPath], with: .fade);
     }
     
     return [delAction]
     }
     */
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        guard let dump = dataHandleController else {
            return
            
        }
        if editingStyle == .delete {
            if dump.removeModel(at: indexPath.section, row: indexPath.row) {
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        }
    }    
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
        guard let dump = dataHandleController else {
            return
            
        }
        if dump.moveModel(moveRowAt: fromIndexPath, to: to) {
            tableView.reloadSections(IndexSet([fromIndexPath.section]), with: .left)
            tableView.reloadRows(at: [to], with: .middle)
        }
    }
    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let identifier = segue.identifier {
            
            switch identifier {
                
            case "eventEdit":
                
                // get view detail may be displayed data cell
                let viewDetail = segue.destination as! EventCellDetail;
                // get and send data to view
                let indexPath = self.tableView.indexPath(for: sender as! UITableViewCell)
                guard let dumpIndexPath = indexPath else {
                    return
                    
                }
                let data = dataHandleController?.getModel(at: dumpIndexPath.section, row: dumpIndexPath.row)!
                viewDetail.setData(myEvent: data!)
                break;

            default:
                break;
            }
        }
    }
    
    func unwrapOptional (obj: Any?) throws -> Any {
        guard (obj != nil) else {
            throw MyErrorHandle.unwrapOptional
            
        }
        return obj!
    }
}
