//
//  DetailViewController.swift
//  YTS_Movies_App
//
//  Created by user202363 on 12/16/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    var Title : String = ""
    var summary : String = ""
    var year : Int = 0
    var rating : Double = 0
    var image_url : String = ""
    

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var movienametxt: UILabel!
    @IBOutlet weak var yeartxt: UILabel!
    @IBOutlet weak var ratingtxt: UILabel!
    @IBOutlet weak var summarytxt: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ServiceController.shared.getImage(url: image_url){
            result in
            switch result{
                case .success(let img):
                    self.image.image = img
                    self.movienametxt.text = "Movie Name: " + self.Title
                    self.yeartxt.text = "Year: " + String(self.year)
                    self.ratingtxt.text = "Rating: " + String(self.rating)
                    self.summarytxt.text = "Summary: " + self.summary
            case .failure(let error):
                print(error)
            }
            
        }

    }
}
