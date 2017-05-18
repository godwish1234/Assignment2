//
//  ProductInfo.swift
//  Online_HospitalApp
//
//  Created by GODWISH JAKIN on 10/5/17.
//  Copyright © 2017 GODWISH JAKIN. All rights reserved.
//

import UIKit
import CoreData

class ProductInfo: UIViewController {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UITextView!
    @IBOutlet weak var productPrice: UITextView!
    @IBOutlet weak var productDesc: UITextView!
    
    private class func getContext() -> NSManagedObjectContext {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FeaturedEntity")
        
        
        do {
        
            let results = try managedContext.fetch(fetchRequest)
            let fetchResult = try
            
            print(results)
        
        } catch {
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CoreDataManager.fetchObj()
        
        //var data : String
            
        //data =  CoreDataManager.fetchObj() as String
        
        //print (data)
        
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
