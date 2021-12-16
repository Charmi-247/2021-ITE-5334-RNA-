//
//  FeedbackViewController.swift
//  YTS_Movies_App
//
//  Created by user202363 on 12/16/21.
//

import UIKit
import CoreData

class FeedbackViewController: UIViewController {

    
    @IBOutlet weak var overallTxt: UITextField!
    @IBOutlet weak var detailTxt: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func submitBtnClicked(_ sender: Any) {
        
        if let filloverall = overallTxt.text{
            CoreDataService.shared.insertNewFeedback(overall: filloverall, detail: detailTxt.text)
            overallTxt.text = ""
            detailTxt.text = ""
        }
        
        var dialog_msg = UIAlertController(title: "Message", message: "Feedback Submitted Successfully", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: {(action) -> Void in
            print("Ok Button tapped")
        })
        dialog_msg.addAction(ok)
        self.present(dialog_msg, animated: true, completion: nil)
    }
    
    

}
