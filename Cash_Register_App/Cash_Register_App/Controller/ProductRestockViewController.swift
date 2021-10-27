//
//  ProductRestockViewController.swift
//  Cash_Register_App
//
//  Created by user202363 on 10/27/21.
//

import UIKit

class ProductRestockViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    //----------UI Object Reference---------------
    @IBOutlet weak var QtyEditText: UITextField!
    @IBOutlet weak var productTable: UITableView!
    
    //----------temporary Variable-------------
    var manager: Manager?
    var index = 0
    var checkFlag = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //-------------Table Function---------------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (manager!.getAllProducts().count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = (manager?.getAllProducts()[indexPath.row].productName)
        cell.detailTextLabel?.text = String((manager?.getAllProducts()[indexPath.row].productQty)!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        checkFlag = 1;
        index = indexPath.row
    }
    
    
    //--------------Action for Restock Button-------------
    @IBAction func RestockButtonClicked(_ sender: Any) {
        if checkFlag == 1
        {
            if QtyEditText.text != "" {
                if let _ = Int(QtyEditText.text!)
                {
                    manager?.getAllProducts()[index].productQty = Int(QtyEditText.text!)!
                    productTable.reloadData()
                }
                else
                {
                    let alert = UIAlertController(title: "Invalid Input", message: "Please Enter only numbers in the Quantity", preferredStyle: .alert)
                    let action = UIAlertAction(title: "Okay", style: .default, handler: nil)
                    alert.addAction(action)
                    present(alert, animated: true, completion: nil)
                }
            }
            else{
                let alert = UIAlertController(title: "Error", message: "Please Enter Quantity to Restock", preferredStyle: .alert)
                let action = UIAlertAction(title: "Okay", style: .default, handler: nil)
                alert.addAction(action)
                present(alert, animated: true, completion: nil)
            }
            
        }
        else{
            let alert = UIAlertController(title: "Error", message: "Please Select a Product before Restocking", preferredStyle: .alert)
            let action = UIAlertAction(title: "Okay", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            
        }
    }
    
    //--------------Action For Cancel Button-------------
    @IBAction func CancelButtonClicked(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
