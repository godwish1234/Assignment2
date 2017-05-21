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

    //declare an outlet
    @IBOutlet weak var mapHospital: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set the user locations
        mapHospital.showsUserLocation = true
        mapHospital.delegate = self
        mapHospital.setUserTrackingMode(MKUserTrackingMode.follow, animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
