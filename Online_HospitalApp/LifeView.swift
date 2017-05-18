//
//  LifeView.swift
//  Online_HospitalApp
//
//  Created by GODWISH JAKIN on 17/5/17.
//  Copyright © 2017 GODWISH JAKIN. All rights reserved.
//

import UIKit
import CoreData

class LifeView: UITableViewController {
    
    

    @IBOutlet var lifeTable: UITableView!
    
    var records : [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "The List"
        lifeTable.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    @IBAction func addRecords(_ sender: Any) {
        
        let alert = UIAlertController(title: "New Record", message: "Add a new record", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) {
        
            [unowned self] action in
            
            guard let textfield = alert.textFields?.first,
                let recordToSave = textfield.text else {return}
            
            
            self.save(name: recordToSave)
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        
        alert.addTextField()
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
        
    }
    
    func save(name: String) {
    
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        //let entity = NSEntityDescription.entity(forEntityName: "HealthData", in: managedContext)!
        
        let entity = NSEntityDescription.entity(forEntityName: "HealthData", in: managedContext)
        
        let record = NSManagedObject(entity: entity!, insertInto: managedContext)
        
        record.setValue(name, forKeyPath: "record")
        
        do {
        
            try managedContext.save()
            records.append(record)
        
        } catch let error as NSError{
        
            print("Could not save. \(error), \(error.userInfo)")
        
        }
    
    
    }

    // MARK: - Table view data source

    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
 
    */

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return records.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        let record = records[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = record.value(forKeyPath: "record") as? String
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "HealthData")
        
        do {
            records = try managedContext.fetch(fetchRequest)
        } catch let error as NSError{
            print("Could not fetch. \(error). \(error.userInfo)")
        }
        
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}




