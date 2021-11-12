//
//  ViewController.swift
//  Image_Viewer_App
//
//  Created by user202363 on 11/12/21.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, AddingImageProtocol {

    
    //------------Reference For ImageView And PickerView----------
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageName: UIPickerView!
    
    //-----------Manager Object--------------
    var manager:ImageManager = ImageManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //--------------Functions for Picker View----------------
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return manager.getAllImages().count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return manager.getAllImages()[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let queue = DispatchQueue.init(label: "1")
        queue.async {
            let data = try? Data(contentsOf: URL(string: self.manager.getAllImages()[row].url)!)
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data!)
            }
        }
    }
    
    //--------------Custom Protocol Function----------
    func controllerDidFinishWithNewImage(NI: Image) {
        manager.addNewImage(n: NI)
        imageName.reloadAllComponents()
    }
    
    func controllerDidCancel() {
        
    }
    
    //------------Prepare Function for Seague-----------
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let AIVC = segue.destination as!addNewImageViewController
        AIVC.delegate = self
    }
}

