//
//  Manager.swift
//  Cash_Register_App
//
//  Created by user202363 on 10/27/21.
//

import Foundation

class Manager {
    
    var productlist = [Product]()
    var purchasehistorylist = [PurchaseHistory]()
    
    //-----------Add new Product to list---------------
    func addNewProduct(newProduct :Product)
    {
        productlist.append(newProduct)
    }
    
    //-------------Get Product List-------------
    func getAllProducts()->[Product]
    {
        return productlist
    }
    
    //-------------Add in Purchase History List----------------
    func addinPurchaseHistory(newPurchasehistory :PurchaseHistory)
    {
        purchasehistorylist.append(newPurchasehistory)
    }
    
    //-------------Get History List------------------
    func getPurchaseHistory()->[PurchaseHistory]
    {
        return purchasehistorylist
    }
}
