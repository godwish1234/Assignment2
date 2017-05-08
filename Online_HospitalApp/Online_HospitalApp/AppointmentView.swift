//
//  SecondViewController.swift
//  Online_HospitalApp
//
//  Created by GODWISH JAKIN on 3/5/17.
//  Copyright © 2017 GODWISH JAKIN. All rights reserved.
//

import UIKit

class AppointmentView: UIViewController {
    
    
    @IBOutlet weak var onlineText: UITextField!
    @IBOutlet weak var doorText: UITextField!
    @IBOutlet weak var findText: UITextField!
    @IBOutlet weak var chatText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set text not editable
        onlineText.isUserInteractionEnabled = false
        doorText.isUserInteractionEnabled = false
        findText.isUserInteractionEnabled = false
        chatText.isUserInteractionEnabled = false
        
        /*
        typeOne.layer.borderWidth = 1
        typeOne.layer.masksToBounds = false
        typeOne.layer.borderColor = UIColor.black.cgColor
        typeOne.layer.cornerRadius = typeOne.frame.height/2
        typeOne.clipsToBounds = true
        */
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

