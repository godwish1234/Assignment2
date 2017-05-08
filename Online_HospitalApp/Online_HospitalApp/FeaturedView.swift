//
//  FirstViewController.swift
//  Online_HospitalApp
//
//  Created by GODWISH JAKIN on 3/5/17.
//  Copyright © 2017 GODWISH JAKIN. All rights reserved.
//

import UIKit

class FeaturedView: UIViewController {
    
    @IBOutlet weak var FeaturedSegment: UISegmentedControl!
    
    @IBOutlet weak var labelTest: UILabel!
    
    @IBAction func TypeChanged(_ sender: Any) {
        switch FeaturedSegment.selectedSegmentIndex {
        case 0:
            labelTest.text = "Featured Product"
        case 1:
            labelTest.text = "Recommended by Us"
        default:
            break
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
