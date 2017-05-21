//
//  ProductCell.swift
//  Online_HospitalApp
//
//  Created by GODWISH JAKIN on 19/5/17.
//  Copyright © 2017 GODWISH JAKIN. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {
    
    //declare outlets
    @IBOutlet weak var ProductImage: UIImageView!
    @IBOutlet weak var ProductName: UITextView!
    @IBOutlet weak var ProductPrice: UITextView!
    @IBOutlet weak var ProductDesc: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
