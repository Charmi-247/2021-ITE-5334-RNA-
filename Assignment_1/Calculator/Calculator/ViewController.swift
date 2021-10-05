//
//  ViewController.swift
//  Calculator
//
//  Created by user202363 on 10/4/21.
//

import UIKit

class ViewController: UIViewController {
    
    //-----------Label and  Textview outlet----------------
    @IBOutlet weak var MainScreenLabel: UILabel!
    
    @IBOutlet weak var HistoryTextView: UITextView!
    
    var AdvanceIsSelected = false
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    //-----------Click Event Handler-------------
    @IBAction func ButtonClickHandler(_ sender: UIButton) {
        
        let ButtonTag = sender.tag
        
        switch ButtonTag {
        case 0:
            push(NumOrOp: "0")
            MainScreenLabel.text! += "0"
        case 1:
            push(NumOrOp: "1")
            MainScreenLabel.text! += "1"
        case 2:
            push(NumOrOp: "2")
            MainScreenLabel.text! += "2"
        case 3:
            push(NumOrOp: "3")
            MainScreenLabel.text! += "3"
        case 4:
            push(NumOrOp: "4")
            MainScreenLabel.text! += "4"
        case 5:
            push(NumOrOp: "5")
            MainScreenLabel.text! += "5"
        case 6:
            push(NumOrOp: "6")
            MainScreenLabel.text! += "6"
        case 7:
            push(NumOrOp: "7")
            MainScreenLabel.text! += "7"
        case 8:
            push(NumOrOp: "8")
            MainScreenLabel.text! += "8"
        case 9:
            push(NumOrOp: "9")
            MainScreenLabel.text! += "9"
        case 10:
            push(NumOrOp: "+")
            MainScreenLabel.text! += "+"
        case 11:
            push(NumOrOp: "-")
            MainScreenLabel.text! += "-"
        case 12:
            push(NumOrOp: "*")
            MainScreenLabel.text! += "*"
        case 13:
            push(NumOrOp: "/")
            MainScreenLabel.text! += "/"
        case 14:
            if validateWorkingString()
            {
                var Result = calculator_brain()
                MainScreenLabel.text! += "= \(Result)"
                
                if AdvanceIsSelected
                {
                    HistoryTextView.text += MainScreenLabel.text! + "\n"
                }
            }
            else
            {
                let alert = UIAlertController(title: "Input Alert", message: "Please Enter Valid Input", preferredStyle: UIAlertController.Style.alert)
                
                // Add an Action Button
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                
                //Show The Alert On Screen
                self.present(alert, animated: true, completion: nil)
                MainScreenLabel.text = ""
            }
        case 15:
            clear()
            MainScreenLabel.text = ""
        case 16:
            if sender.currentTitle == "Advance - With History"
            {
                sender.setTitle("Standard - No History", for: .normal)
                HistoryTextView.isHidden = false
                AdvanceIsSelected = true
            }
            else
            {
                sender.setTitle("Advance - With History", for: .normal)
                HistoryTextView.isHidden = true
                HistoryTextView.text = ""
                AdvanceIsSelected = false
            }
        default:
            break
        }
    }
}

