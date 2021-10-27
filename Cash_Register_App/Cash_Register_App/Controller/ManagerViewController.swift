//
//  ManagerViewController.swift
//  Cash_Register_App
//
//  Created by user202363 on 10/27/21.
//

import UIKit

class ManagerViewController: UIViewController {

    var manager: Manager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //-----------Prepare For next View-----------------
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if(segue.identifier == "PurchaseHistory")
        {
            let PHTVC = segue.destination as? PurchaseHistoryTableViewController
            PHTVC?.manager = manager
        }
        if(segue.identifier == "Restock")
        {
            let PRVC = segue.destination as? ProductRestockViewController
            PRVC?.manager = manager
        }
    }
}
