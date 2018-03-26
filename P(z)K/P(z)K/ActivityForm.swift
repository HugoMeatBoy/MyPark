//
//  ActivityForm.swift
//  P(z)K
//
//  Created by Thais AURARD on 23/03/2018.
//  Copyright © 2018 Thais AURARD. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ActivityForm : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    
    var pickerData : [String] = [String]()
    var activityTypeNameTab: [String] = [String]()
    var newActivityTypevar : ActivityType!
    var newActivity : Activity!
    
    
    @IBOutlet weak var ActivityTypePicker: UIPickerView!
    

    @IBAction func AddActivityType(_ sender: Any) {
    }
    
    
    
    @IBOutlet weak var DurationH: UITextField!
    
    @IBOutlet weak var DurationMin: UITextField!
    
    
    @IBAction func ValidateAddActivity(_ sender: Any) {
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ActivityTypePicker.delegate = self
        ActivityTypePicker.dataSource = self

        
        let activityTypeDAO = CoreDataDAOFactory.getInstance().getActivityTypeDAO()
        let activityDAO = CoreDataDAOFactory.getInstance().getActivityDAO()
        
        var activityTypes : [ActivityType] = [ActivityType]()
        
        do{
            activityTypes = try activityTypeDAO.getAll() as! [ActivityType]
            
            for _ in (activityTypes){
                activityTypeNameTab.append(activityTypes.first?.activityTypeName as! String)
                activityTypeNameTab.removeFirst()
            }
            
        }catch let error as NSError {
            ManageErrorHelper.alertError(view: self, error: error)
        }
        

        
        if(activityTypeNameTab[ActivityTypePicker.selectedRow(inComponent: 0)] != nil && DurationH.text != nil && DurationMin.text != nil){

            let i = ActivityTypePicker.selectedRow(inComponent: 0)
            newActivity.activityName = activityTypeNameTab[i]

            }
            newActivity.activityDurationH = DurationH.text
            newActivity.activityDurationMin = DurationMin.text
            
            do {
                try
                    activityDAO.save()
            }
            catch let error as NSError{
                ManageErrorHelper.alertError(view: self, error: error)
            }
            

        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Number of columns
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return activityTypeNameTab.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return activityTypeNameTab[row]
    }
    
    
    // Catpure the picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
    }
}
