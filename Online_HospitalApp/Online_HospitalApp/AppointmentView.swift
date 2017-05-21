//
//  SecondViewController.swift
//  Online_HospitalApp
//
//  Created by GODWISH JAKIN on 3/5/17.
//  Copyright © 2017 GODWISH JAKIN. All rights reserved.
//

import UIKit

class AppointmentView: UIViewController {
    
    //declare outlets
    @IBOutlet weak var doorText: UITextField!
    @IBOutlet weak var findText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doorText.isUserInteractionEnabled = false
        findText.isUserInteractionEnabled = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

