//
//  LifeView.swift
//  Online_HospitalApp
//
//  Created by GODWISH JAKIN on 18/5/17.
//  Copyright © 2017 GODWISH JAKIN. All rights reserved.
//

import UIKit
import CoreData

class LifeView: UITableViewController {

    //declare outlets for tables
    @IBOutlet var lifeTable: UITableView!
    
    //declare a managedObject array
    var records : [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lifeTable.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        tableView.tableFooterView = UIView()
        
    }
    
    //actions to add records for storing the user's input data
    @IBAction func addRecords(_ sender: Any) {
        
        //creating an alert
        let alert = UIAlertController(title: "New Record", message: "Add a new record", preferredStyle: .alert)
        
        //save action
        let saveAction = UIAlertAction(title: "Save", style: .default) {
            
            [unowned self] action in
            
            guard let textfield = alert.textFields?.first,
                let recordToSave = textfield.text
        
                else {return}
            
            self.save(name: recordToSave)
            self.tableView.reloadData()
        }
        
        //cancel action
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        
        alert.addTextField()
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
        
    }
    
    //function to save the data and store in the database entity called "HealthData"
    func save(name: String) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
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
    
    //function to fetch the list of notes from the database
    func fetch() {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "HealthData")
        
        do {
            records = try managedContext.fetch(fetchRequest)
        } catch let error as NSError{
            print("Could not fetch. \(error). \(error.userInfo)")
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
        
        fetch()
        
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete{
        
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
            
            let managedContext = appDelegate.persistentContainer.viewContext
            
            managedContext.delete(self.records[indexPath.row])
            
            do {
            
                try managedContext.save()
                self.records.removeAll()
                fetch()
                lifeTable.reloadData()
                
            
            } catch let error as NSError {
                print("Could not fetch. \(error). \(error.userInfo)")
            }
            
        
        }
        
    }

}
