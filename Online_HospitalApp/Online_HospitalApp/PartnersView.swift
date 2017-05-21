//
//  PartnersView.swift
//  Online_HospitalApp
//
//  Created by GODWISH JAKIN on 19/5/17.
//  Copyright © 2017 GODWISH JAKIN. All rights reserved.
//

import UIKit

class PartnersView: UITableViewController {
    
    //declare variable
    var links = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //declare array of links
        links = ["http://chemistwarehouse.com.au", "http://pharmacyonline.com.au", "http://goodpricepharmacy.com.au"]
        
        Utilities.loadPartners()
        self.tableView.contentInset = UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0)
        
        tableView.tableFooterView = UIView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Utilities.partners.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "partnerCell", for: indexPath)
        cell.textLabel?.text = "\(Utilities.partners[indexPath.row].Name)"
        cell.imageView?.image = Utilities.partners[indexPath.row].Image

        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let linkPath = links[indexPath.row]
        let url = URL(string: linkPath)
        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
        
    }

}
