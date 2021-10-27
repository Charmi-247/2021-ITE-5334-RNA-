//
//  Product.swift
//  Cash_Register_App
//
//  Created by user202363 on 10/27/21.
//

import Foundation

class Product
{
    var productName : String
    var productQty : Int
    var productPrice: Float
    
    
    //-------------initializer---------------
    init(name : String, qty: Int, price: Float)
    {
        productName = name
        productQty = qty
        productPrice = price
    }
}
