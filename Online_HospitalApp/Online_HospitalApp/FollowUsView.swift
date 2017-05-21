//
//  FollowUsView.swift
//  Online_HospitalApp
//
//  Created by GODWISH JAKIN on 21/5/17.
//  Copyright © 2017 GODWISH JAKIN. All rights reserved.
//

import UIKit

class FollowUsView: UIViewController {

    //actions to go to the links when user clicks the image button
    @IBAction func goToFB(_ sender: UIButton) {
        let url = URL(string: "https://www.facebook.com/godwish.jakin")
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }
    
    @IBAction func goToTweet(_ sender: UIButton) {
        let url = URL(string: "https://twitter.com/godwish_20")
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }
    
    @IBAction func goToInsta(_ sender: UIButton) {
        let url = URL(string: "https://www.instagram.com/godwishjakin/")
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
