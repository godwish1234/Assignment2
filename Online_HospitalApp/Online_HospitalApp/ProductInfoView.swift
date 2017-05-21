//
//  ProductInfoView.swift
//  Online_HospitalApp
//
//  Created by GODWISH JAKIN on 19/5/17.
//  Copyright © 2017 GODWISH JAKIN. All rights reserved.
//

import UIKit
import CoreData

class ProductInfoView: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //load product list from ProductInfo class
        ProductInfo.LoadInfo()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return ProductInfo.products.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ProductCell

        let object = ProductInfo.products[indexPath.row]
        
        cell.ProductName.text = object.productName
        cell.ProductDesc.text = object.productDescription
        cell.ProductPrice.text = object.productPrice
        
        return cell
    }

}
