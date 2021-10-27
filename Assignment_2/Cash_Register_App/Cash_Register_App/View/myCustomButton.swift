//
//  myCustomButton.swift
//  Cash_Register_App
//
//  Created by user202363 on 10/27/21.
//

import UIKit

class myCustomButton: UIButton {

    //-------------initializer---------------
    override init(frame: CGRect) {
        super.init(frame: frame)
                    
    }
    
    required init?(coder: NSCoder) {
        
        //Layer
        super.init(coder: coder)
        layer.cornerRadius = 24
    }
}
