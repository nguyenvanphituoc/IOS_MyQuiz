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
    var dayEvents : [DayMoDel] = [] 
//    lazy var dayEvents : [DayMoDel] { <- What is called, how that map the func not a create data
       // When you call self.dayEvents, this function will be called. OK?
       // Jump into DayMoDel.EventsInWeak() <- viet sai chinh ta roi chu'
       // hhe, I will load data in viewDidLoad() right?
        //First, check the below function
//        return DayMoDel.EventsInWeak()
//    }
    
    // MARK: - Table view data source
    
    override func viewDidLoad() {
        
        //initial datasource
        dayEvents = DayMoDel.EventsInWeek();
        //edit button
        navigationItem.rightBarButtonItem = editButtonItem
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        // #warning Incomplete implementation, return the number of sections
        return dayEvents.count;
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        // When you do this dayEvents[] => the function in line 19 will be called because dayEvents is a "computed property"
        // You must change dayEvents to become a "stored property" or lazy var
        // okay, now I'm understand, tks ^^ love ya <3, my mistake when I watching video tutorial
        // Ok, just remember: Do not use computed property too much. It will impact your application's performance
        return dayEvents[section].name.rawValue;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // #warning Incomplete implementation, return the number of rows
        return dayEvents[section].events.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! CustomEventTableViewCell
        
        // Configure the cell...
        let dayEvent = dayEvents[indexPath.section];
        let event = dayEvent.events[indexPath.row];
        cell.setCellData(event: event)
        
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
        
        if editingStyle == .delete {
            
            let dayEvent = dayEvents[indexPath.section]		
            dayEvent.events.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
        sortEvent(moveRowAt: fromIndexPath, to: to)
    }
    
    
    func sortEvent(moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
        // get data was moved
        let eventTemp = dayEvents[fromIndexPath.section].events[fromIndexPath.row]
        // remove data from fromIndexPath
        dayEvents[fromIndexPath.section].events.remove(at: fromIndexPath.row)
        // insert data to toIndexpath
        dayEvents[to.section].events.insert(eventTemp, at: to.row)
        
        // If change day <=> move another section
        if fromIndexPath.section != to.section {
            
            // change day
            eventTemp.time = dayEvents[to.section].name
            //reload after change
            tableView.reloadRows(at : [to], with: .middle)
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
                
            case "eventDetail":
                
                // get view detail may be displayed data cell
                let viewDetail = segue.destination as! EventCellDetail;
                // get and send data to view
                let indexPath = self.tableView.indexPath(for: sender as! UITableViewCell)
                viewDetail.setData(dayEvent: dayEvents[(indexPath?.section)!], row: (indexPath?.row)!)
                break;
                
            default:
                
                break;
            }
        }
    }
    
    //MARK helper
    func productAtIndexPath( indexPath : IndexPath) -> AbsEventModel {
        
        // return the event of day with indexPath
        let day = dayEvents[indexPath.section]
        return day.events[indexPath.row];
    }
    
    
}
