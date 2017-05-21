//
//  DoorToDoorView.swift
//  Online_HospitalApp
//
//  Created by GODWISH JAKIN on 21/5/17.
//  Copyright © 2017 GODWISH JAKIN. All rights reserved.
//

import UIKit
import Foundation

class DoorToDoorView: UITableViewController {
    
    //declare variables
    @IBOutlet weak var fullNameTextField: UITextField!
    
    @IBOutlet weak var valueAge: UITextView!
    
    @IBOutlet weak var stepperAge: UIStepper!
    
    @IBOutlet weak var symthompsTextField: UITextView!
    
    @IBOutlet weak var dateTextField: UITextField!
    
    @IBOutlet weak var addressTextField: UITextView!
    
    
    //action for stepper
    @IBAction func stepperAgeValueChanged(_ sender: UIStepper) {
        valueAge.text = Int(sender.value).description
    }
    
    
    //action for datepicking
    @IBAction func datePicker(_ sender: UITextField) {
        
        let datePickerView = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.date
        
        datePickerView.addTarget(self, action: #selector(DoorToDoorView.datePickerValueChanged(sender:)), for: UIControlEvents.valueChanged)
        
        dateTextField.inputView = datePickerView
        
    }
    
    //action for date picking when value has been changed
    func datePickerValueChanged(sender: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeStyle = DateFormatter.Style.none
        dateTextField.text = dateFormatter.string(from: sender.date)
        
    }
    
    //action for reset button
    @IBAction func resetAll(_ sender: Any) {
        fullNameTextField.text = ""
        valueAge.text = ""
        stepperAge.value = 0
        symthompsTextField.text = ""
        dateTextField.text = ""
        addressTextField.text = ""
        
    }
    
    //action to trigger when user touch the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    //action for submit button (an alert will be shown and the go to the choose appointment type
    @IBAction func submitAll(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Thank you!", message: "You have submitted your order", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Confirm", style: .default, handler: {(alert) in _ = self.navigationController?.popViewController(animated: true)})
        
        alert.addAction(saveAction)
        
        present(alert, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        stepperAge.wraps = true
        stepperAge.autorepeat = true
        stepperAge.maximumValue = 100
        stepperAge.minimumValue = 0
        
        symthompsTextField.layer.borderWidth = 1.0
        symthompsTextField.layer.cornerRadius = 5.0
        
        addressTextField.layer.borderWidth = 1.0
        addressTextField.layer.cornerRadius = 5.0
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

}
