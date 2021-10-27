//
//  PurchaseHistory.swift
//  Cash_Register_App
//
//  Created by user202363 on 10/27/21.
//

import Foundation

class PurchaseHistory
{
    var productName : String
    var productQty : Int
    var totalPrice: Double
    var purchaseDate: String
    
    //-------------initializer---------------
    init(name : String, qty: Int, total: Double, date: String)
    {
        productName = name
        productQty = qty
        totalPrice = total
        purchaseDate = date
    }
}
