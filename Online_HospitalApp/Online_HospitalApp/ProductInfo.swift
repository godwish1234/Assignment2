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
    
    

    static var products : [FeaturedEntity] = []
    
    class func LoadInfo() {
        
        let context = (UIApplication.shared.delegate as! AppDelegate ).persistentContainer.viewContext
        
        do {
            
            let req: NSFetchRequest<FeaturedEntity> = FeaturedEntity.fetchRequest()
            products = try context.fetch(req)
            
        } catch let err{
            print(err)
        }
        
        if products.count == 0 {
            
            let img = UIImage(named: "chemist.png")
            let imageData = UIImagePNGRepresentation(img!)
            /*
            let storeDescription = NSEntityDescription.entity(forEntityName: "FeaturedEntity", in: context)
            let store = Store(entity: storeDescription, insertInto: context)
            */
            //store.productImage = imageData
            
            let product = FeaturedEntity(context: context)
            product.productName = "Panadol"
            product.productDescription = "Headache"
            product.productPrice = "$20"
            //product.image = imageData
            product.setValue(imageData, forKey: "productImage")
            
            //print(imageData)
            
            products.append(product)
            print (product)
            
            /*
            product.productName = "asasd"
            product.productDescription = "Stomachache"
            product.productPrice = "$30"
            products.append(product)
            print (product)
 */
            
            try! context.save()
        }
        
    }

}


