//
//  MyProductTableViewCTC.swift
//  MyQuiz
//
//  Created by Cntt34 on 4/19/17.
//  Copyright © 2017 nguyenvanphituoc. All rights reserved.
//

import UIKit

class MyProductTableViewCTC: UITableViewController {

    //datasource
    lazy var productLines : [ProductLine] = {
        
        return ProductLine.productLines();
    }()
    
    
    var productSender : Product = Product();
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return productLines.count;
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return productLines[section].name;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return productLines[section].products.count;
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        // Configure the cell...
        let productLine = productLines[indexPath.section];
        let product = productLine.products[indexPath.row];
        cell.textLabel?.text = product.title;
        cell.detailTextLabel?.text = product.description;
        cell.imageView?.image = product.image
        
        
        return cell
    }
    // send data
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Get Cell Label
        let indexPath = tableView.indexPathForSelectedRow!
        let currentCell = tableView.cellForRow(at: indexPath)! as UITableViewCell
        
        productSender =  Product();
        productSender.image = (currentCell.imageView?.image)!
        productSender.title = (currentCell.textLabel?.text)!
        productSender.description = (currentCell.detailTextLabel?.text)!
        
        performSegue(withIdentifier: "myCell", sender: self)
    }
    
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        
        if (segue.identifier == "myCell") {
            // initialize new view controller and cast it as your view controller
            var viewController = segue.destination as! CellDetail
            // your new view controller should have property that will store passed value
            viewController.setValue(productSender, forKey: "celldetail")
        }
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
