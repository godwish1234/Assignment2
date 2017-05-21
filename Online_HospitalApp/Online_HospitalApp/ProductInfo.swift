//
//  ProductInfo.swift
//  Online_HospitalApp
//
//  Created by GODWISH JAKIN on 19/5/17.
//  Copyright © 2017 GODWISH JAKIN. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ProductInfo: NSManagedObject {
    
    //declare an array from the database
    static var products : [FeaturedEntity] = []
    
    //class for load product info
    class func LoadInfo() {
        
        let context = (UIApplication.shared.delegate as! AppDelegate ).persistentContainer.viewContext
        
        do {
            
            let req: NSFetchRequest<FeaturedEntity> = FeaturedEntity.fetchRequest()
            products = try context.fetch(req)
            
        } catch let err{
            print(err)
        }
        
        if products.count == 0 {
            
            let product = FeaturedEntity(context: context)
            product.productName = "Band Aid"
            product.productDescription = "Advanced Healing bandage provides long lasting protection. These bandages allow for faster healing of minor cuts and scrapes than ordinary bandages. Their superior adhesion means they'll stay on for several days, acting like an instant scab to seal in your body's own natural healing fluids."
            product.productPrice = "$7.8"
            
            products.append(product)
            
            try! context.save()
        }
        
    }

}


