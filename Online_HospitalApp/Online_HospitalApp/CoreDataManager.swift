//
//  CoreDataManager.swift
//  Online_HospitalApp
//
//  Created by GODWISH JAKIN on 10/5/17.
//  Copyright © 2017 GODWISH JAKIN. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager: NSObject {
    private class func getContext() -> NSManagedObjectContext {
    
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    
    }
    
    class func storeObj() {
    
        let context = getContext()
        
        let entity = NSEntityDescription.entity(forEntityName: "FeaturedEntity", in: context)
    
        
        let managedObj = NSManagedObject(entity: entity!, insertInto: context)
        
        managedObj.setValue("Panadol", forKey: "productName")
        managedObj.setValue("For fever and cold", forKey: "productDescription")
        managedObj.setValue(25, forKey: "productPrice")
        
        managedObj.setValue("Panadol", forKey: "productName")
        managedObj.setValue("For fever and cold", forKey: "productDescription")
        managedObj.setValue(25, forKey: "productPrice")
        
        
        
        //managedObj.setValue("", forKey: "image")
        
        do {
        
            try context.save()
            print("saved")
        
        } catch {
        
            print(error.localizedDescription)
        
        }
    }
    
    class func fetchObj() -> [imageItem]{
        
        var array = [imageItem]()
        
        let fetchRequest:NSFetchRequest<FeaturedEntity> = FeaturedEntity.fetchRequest()
        
        do {
        
            let fetchResult = try getContext().fetch(fetchRequest)
            
            for item in fetchResult {
            
                let img = imageItem(name: item.productName!, description: item.productDescription!, price: Int32(item.productPrice))
                array.append(img)
                
                let request = NSFetchRequest<NSFetchRequestResult>(entityName: "FeaturedEntity")
                
                
                
                
                
                print(img.Name)
                print(img.Description)
                print(img.Price)
            
            }
            
            
        }catch {
        
        
        }
        
        return array
    
    }
}

struct imageItem {
    var Name:String?
    var Description:String?
    var Price:Int32?
    
    init() {
        Name = ""
        Description = ""
        Price = 0
        
    }
    
    init(name:String, description:String, price:Int32) {
        self.Name = name
        self.Description = description
        self.Price = price
    }
    
}






