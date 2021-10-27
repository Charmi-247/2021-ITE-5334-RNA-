//
//  myCustomTableViewCell.swift
//  Cash_Register_App
//
//  Created by user202363 on 10/27/21.
//

import UIKit

class myCustomTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productQty: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
