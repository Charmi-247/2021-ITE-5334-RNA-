//
//  PurchaseHistoryTableViewController.swift
//  Cash_Register_App
//
//  Created by user202363 on 10/27/21.
//

import UIKit

class PurchaseHistoryTableViewController: UITableViewController {

    
    var manager: Manager?
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //-----------------Table Function--------------

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return (manager?.getPurchaseHistory().count)!
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = manager?.getPurchaseHistory()[indexPath.row].productName
        
        cell.detailTextLabel?.text =  "\( manager?.getPurchaseHistory()[indexPath.row].productQty ?? 0)"


        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        index = indexPath.row
    }
    
    //-------------prepare for next view--------------
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let PHVC = segue.destination as? ProductHistoryViewController
        PHVC!.purchaseHistory = manager?.getPurchaseHistory()[index]
    }
}
