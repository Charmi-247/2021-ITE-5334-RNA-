//
//  addNewImageViewController.swift
//  Image_Viewer_App
//
//  Created by user202363 on 11/12/21.
//

import UIKit

//------------Custom Protocol---------------
protocol AddingImageProtocol {
    func controllerDidFinishWithNewImage(NI:Image)
    func controllerDidCancel()
}

class addNewImageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //-------------UI Reference and Variable Declaration----------
    var delegate:AddingImageProtocol?
    @IBOutlet weak var imageName: UITextField!
    @IBOutlet weak var imageURL: UITextField!
    
    //--------IBAction for Add Button-----------
    @IBAction func Add_Button_Clicked(_ sender: Any) {
        if let name = imageName.text{
            if let url = imageURL.text{
                if !name.isEmpty && !url.isEmpty{
                    let newImage = Image(n: name, u: url)
                    delegate?.controllerDidFinishWithNewImage(NI: newImage)
                    dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    //----------IBAction For Cancel Button----------
    @IBAction func Cancel_Button_Clicked(_ sender: Any) {
        delegate?.controllerDidCancel()
        dismiss(animated: true, completion: nil)
    }
    
}
