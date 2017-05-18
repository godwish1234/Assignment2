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
    @IBOutlet weak var Images: UIImageView!
    
    @IBOutlet weak var imageStatic1: UIButton!
    @IBOutlet weak var imageStatic2: UIButton!
    @IBOutlet weak var imageStatic3: UIButton!
    @IBOutlet weak var imageStatic4: UIButton!
    @IBOutlet weak var imageStatic5: UIButton!
    @IBOutlet weak var imageStatic6: UIButton!
    
    
    @IBAction func TypeChanged(_ sender: Any) {
        switch FeaturedSegment.selectedSegmentIndex {
        case 0:
            labelTest.text = "Featured Product"
            
            imageStatic1.setBackgroundImage(UIImage(named: "medShow1"), for: .normal)
            
            imageStatic2.setBackgroundImage(UIImage(named: "medShow2"), for: .normal)
            
            imageStatic3.setBackgroundImage(UIImage(named: "medShow3"), for: .normal)
            
            imageStatic4.setBackgroundImage(UIImage(named: "medShow4"), for: .normal)
            
            imageStatic5.setBackgroundImage(UIImage(named: "medShow5"), for: .normal)
            
            imageStatic6.setBackgroundImage(UIImage(named: "medShow6"), for: .normal)
            
            break
        case 1:
            labelTest.text = "Recommended by Us"
            
            break
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //CoreDataManager.storeObj()
        
        var images = ["medShow1", "medShow2", "medShow3", "medShow4", "medShow5", "medShow6"]
        
        var imagesList = [UIImage]()
        
        for i in 0..<images.count {
        
            imagesList.append(UIImage(named: images[i])!)
        }
        Images.animationImages = imagesList
        Images.animationDuration = 20.0
        Images.startAnimating()
        
        switch FeaturedSegment.selectedSegmentIndex {
        case 0:
            labelTest.text = "Featured Product"
            
            imageStatic1.setBackgroundImage(UIImage(named: "medShow1"), for: .normal)
            
            imageStatic2.setBackgroundImage(UIImage(named: "medShow2"), for: .normal)
            
            imageStatic3.setBackgroundImage(UIImage(named: "medShow3"), for: .normal)
            
            imageStatic4.setBackgroundImage(UIImage(named: "medShow4"), for: .normal)
            
            imageStatic5.setBackgroundImage(UIImage(named: "medShow5"), for: .normal)
            
            imageStatic6.setBackgroundImage(UIImage(named: "medShow6"), for: .normal)
            
            break
        case 1:
            labelTest.text = "Recommended by Us"
            
            break
        default:
            break
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
