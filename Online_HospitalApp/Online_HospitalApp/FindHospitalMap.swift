//
//  FindHospitalMap.swift
//  Online_HospitalApp
//
//  Created by GODWISH JAKIN on 8/5/17.
//  Copyright © 2017 GODWISH JAKIN. All rights reserved.
//

import UIKit
import MapKit

class FindHospitalMap: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapHospital: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapHospital.showsUserLocation = true
        mapHospital.delegate = self
        mapHospital.setUserTrackingMode(MKUserTrackingMode.follow, animated: true)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
