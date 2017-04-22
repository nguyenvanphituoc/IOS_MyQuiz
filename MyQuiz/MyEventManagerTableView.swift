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
    var days : [DayMoDel] {
        
        return DayMoDel.EventsInWeak()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return days.count;
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return days[section].name;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return days[section].events.count;
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! CustomEventTableViewCell

        // Configure the cell...
        let day = days[indexPath.section];
        let event = day.events[indexPath.row];
        
        cell.lbTitle.text = event.title;
        cell.txtDescription.text = event.description;
        
//        cell.btnStatus.setTitle("A", for: .normal);
        cell.lbTime.text = "00:00:00"
        
        switch event.status {
        case .Incoming:
            cell.btnStatus.setTitle("🛑", for: .normal)
        default:
            cell.btnStatus.setTitle("✅", for: .normal)
        }
        
        return cell
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
 /*   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let identifier = segue.identifier {
            switch identifier {
            case "mySegue":
                let viewDetail = segue.destination as! CellDetail;
                let indexPath = self.tableView.indexPath(for: sender as! UITableViewCell)
                
                viewDetail.product = productAtIndexPath(indexPath: indexPath!)
                
            default:
                break;
            }
        }
    }
    
    //MARK helper
    func productAtIndexPath( indexPath : IndexPath) -> EventModel {
        
        let day = days[indexPath.section]
        return day.events[indexPath.row];
    }
 */

}
