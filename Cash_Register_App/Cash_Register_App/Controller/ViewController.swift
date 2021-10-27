//
//  ViewController.swift
//  Cash_Register_App
//
//  Created by user202363 on 10/26/21.
//

import UIKit

class ViewController: UIViewController,
                      UITableViewDelegate,
                      UITableViewDataSource{

    //----------------UIComponent Reference------------------
    @IBOutlet weak var productTypeLabel: UILabel!
    @IBOutlet weak var productTotalLabel: UILabel!
    @IBOutlet weak var ProductQtyLabel: UILabel!
    @IBOutlet weak var productTable: UITableView!
    
    //-----------------Manager Class Object to handle the List-------------
    var manager: Manager = Manager()
    
    //---------------Temporary Variable-----------------
    var index = 0
    var counter = 0
    
    //-----------Static Data------------------
    var productName:[String] = ["Pants","Shoes","Hats","Tshirts","Dresses","Jacket","Specs"]
    var productQty: [Int] = [20,50,10,10,24,11,15]
    var productPrice: [Float] = [50.9,90,20.5,21.75,69.53,124.99,19.99]
    
    
    //---------initial Data load--------------
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0..<productName.count
        {
            manager.addNewProduct(newProduct: Product(name: productName[i], qty: productQty[i], price: productPrice[i]))
        }
    }
    
    //------------Data Reload after coem back from next view-------------
    override func viewWillAppear(_ animated: Bool) {
        productTable.reloadData()
    }

    //------------Table Functions-----------------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manager.getAllProducts().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as! myCustomTableViewCell
        
        cell.productName.text = manager.getAllProducts()[indexPath.row].productName
        cell.productQty.text = String(manager.getAllProducts()[indexPath.row].productQty)
        cell.productPrice.text = String(manager.getAllProducts()[indexPath.row].productPrice)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        index = indexPath.row
        let name = manager.getAllProducts()[indexPath.row].productName
        productTypeLabel.text? =  name
        ProductQtyLabel.text = ""
        productTotalLabel.text = ""
    }
    
    
    //-------------Action For all number Button--------------
    @IBAction func numberButtonClicked(_ sender: myCustomButton) {
        if (productTypeLabel.text != "Type")
        {
            var Qty:Float;
            var totalprice : Float;
            
            let unitPrice = manager.getAllProducts()[index].productPrice
            counter += 1
            let number = sender.titleLabel?.text
            if(counter == 1)
            {
                ProductQtyLabel.text = number!
            }
            else
            {
                ProductQtyLabel.text?.append(number!)
            }
                
            Qty = Float(ProductQtyLabel.text!)!
            totalprice = Qty * unitPrice
            productTotalLabel.text = String(totalprice)
            
        }
        else
        {
            let alert = UIAlertController(title: "Error", message: "Please Select product first from the table", preferredStyle: .alert)

            let action = UIAlertAction(title: "Okay", style: .default, handler: nil)

            alert.addAction(action)

            present(alert, animated: true, completion: nil)
        }
    }
    
    
    //--------------------Action for Buy Button---------------------
    @IBAction func buyButtonClicked(_ sender: myCustomButton) {
        
        let productQtyEntered = Int(ProductQtyLabel.text!)!
        let productQtyLeft = manager.getAllProducts()[index].productQty
        
        if productQtyEntered > productQtyLeft {
            let alert = UIAlertController(title: "Invalid Entry", message: "The Quantity You Entered Exceed the Available Quantity", preferredStyle: .alert)

            let action = UIAlertAction(title: "Okay", style: .default, handler: nil)

            alert.addAction(action)

            present(alert, animated: true, completion: nil)
            ProductQtyLabel.text = "Quantity"
            productTotalLabel.text = "Total"
            productTypeLabel.text = "Type"
            counter = 0
        }
        else
        {
            manager.getAllProducts()[index].productQty = productQtyLeft - productQtyEntered
            
            let date = Date()
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "MM/dd/yyyy, HH:mm:ss"
            manager.addinPurchaseHistory(newPurchasehistory: PurchaseHistory(name: productTypeLabel.text!, qty: productQtyEntered,total: Double(productTotalLabel.text!)!,date: dateformatter.string(for: date)!))
            
            
            ProductQtyLabel.text = "Quantity"
            productTotalLabel.text = "Total"
            productTypeLabel.text = "Type"
            counter = 0
        }
        
        productTable.reloadData()
    }
    
    
    //----------------Prepare For next View--------------------
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let MVC = segue.destination as? ManagerViewController
        MVC!.manager = manager
    }
    
}

