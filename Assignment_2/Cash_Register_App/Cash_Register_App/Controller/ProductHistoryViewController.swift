//
//  ProductHistoryViewController.swift
//  Cash_Register_App
//
//  Created by user202363 on 10/27/21.
//

import UIKit

class ProductHistoryViewController: UIViewController {

    
    //------------UILabel Reference---------------
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productQtyLabel: UILabel!
    @IBOutlet weak var productTotalLabel: UILabel!
    @IBOutlet weak var purchaseDateLabel: UILabel!
    
    //-----------Object of Purchase History--------------
    var purchaseHistory : PurchaseHistory?

    //---------------Load data in Label------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        productNameLabel.text = purchaseHistory?.productName
        productQtyLabel.text = String(purchaseHistory!.productQty)
        productTotalLabel.text = "Total Amount: " + String(purchaseHistory!.totalPrice)
        purchaseDateLabel.text = purchaseHistory?.purchaseDate
        self.title = purchaseHistory?.productName
        
    }

}
