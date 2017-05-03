//
//  DemoTableViewTableViewController.swift
//  MyQuiz
//
//  Created by PhiTuocMacOS on 4/21/17.
//  Copyright © 2017 nguyenvanphituoc. All rights reserved.
//

import UIKit

class DemoTableViewTableViewController: UITableViewController {
    
    lazy var productLines : [ProductLine] = { () -> [ProductLine] in
        return ProductLine.productLines()
    }()
    var filteredProduct = [Product]()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        searchController.searchResultsUpdater = self as? UISearchResultsUpdating
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        
        searchController.searchBar.scopeButtonTitles = ["All", "iDevices", "Mac", "Software", "iPod", "Services"]
        searchController.searchBar.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        if searchController.isActive && searchController.searchBar.text != "" {
            return 1
        }
        // #warning Incomplete implementation, return the number of sections
        return productLines.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if searchController.isActive && searchController.searchBar.text != "" {
            return filteredProduct.count
        }
        return productLines[section].products.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if searchController.isActive && searchController.searchBar.text != "" {
            return "Search result"
        }
        return productLines[section].name
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        // Configure the cell...
        var product : Product?
        if (searchController.isActive && searchController.searchBar.text != "" ) {
            product = filteredProduct[indexPath.row]
        }
        else {
            let productLine : ProductLine
            productLine = productLines[indexPath.section]
            product = productLine.products[indexPath.row]
        }
        
        cell.imageView?.image = product!.image;
        cell.textLabel?.text = product!.title;
        cell.detailTextLabel?.text = product!.description;
        
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let identifier = segue.identifier {
            switch identifier {
            case "mySegue":
                let viewDetail = segue.destination as! CellDetail;
                let indexpath = self.tableView.indexPath(for: sender as! UITableViewCell)
                
                viewDetail.product = productAtIndexPath(indexPath: indexpath!);
            default:
                break;
            }
        }
    }
    
    
    // mark : get product
    func productAtIndexPath (indexPath : IndexPath) -> Product {
        
        var product : Product?
        if (searchController.isActive && searchController.searchBar.text != "" ) {
            product = filteredProduct[indexPath.row]
        }
        else {
            let productLine : ProductLine
            productLine = productLines[indexPath.section]
            product = productLine.products[indexPath.row]
        }
        return product!
    }
    
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        for productLine in productLines {
            let templateProduct = productLine.products.filter { product in
                let categoryMatch = (scope == "All") || (productLine.name == scope)
                return  categoryMatch && product.title.lowercased().contains(searchText.lowercased())
            }
//            filteredProduct.append(contentsOf: templateProduct)
            filteredProduct = templateProduct
        }
        tableView.reloadData()
    }
    
}


extension DemoTableViewTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchText: searchController.searchBar.text!, scope: scope)
    }
}

extension DemoTableViewTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchText: searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
}
