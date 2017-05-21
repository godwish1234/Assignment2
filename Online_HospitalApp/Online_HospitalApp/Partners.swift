//
//  Partners.swift
//  Online_HospitalApp
//
//  Created by GODWISH JAKIN on 19/5/17.
//  Copyright © 2017 GODWISH JAKIN. All rights reserved.
//

import Foundation
import UIKit

class Partners {
    
    //declare variables
    var Name : String
    var Image : UIImage
    
    init(name : String, image : UIImage) {
        self.Name = name
        self.Image = image
    }
}

//class utilities for loading the list of partners
class Utilities {
    static var partners : [Partners] = []
    static func loadPartners() {
        
        partners = [
        
            Partners(name: "Chemist WareHouse", image: UIImage(named: "chemist")!),
            Partners(name: "Pharmacy Online", image: UIImage(named: "pharmacyonline")!),
            Partners(name: "Good Price", image: UIImage(named: "goodprice")!)
        
        ]
        
    }
}
