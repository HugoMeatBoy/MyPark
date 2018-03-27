//
//  ActivityFormViewController.swift
//  P(z)K
//
//  Created by Thais Aurard on 27/03/2018.
//  Copyright © 2018 Thais AURARD. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ActivityFormViewController : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{

    @IBOutlet weak var activityPicker: UIPickerView!
    
    @IBOutlet weak var hourTimeDuration: UITextField!
    @IBOutlet weak var minutesTimesDuration: UITextField!
    
    var activityTypeNameTab: [String] = [String]()
    let activityTypeDAO = CoreDataDAOFactory.getInstance().getActivityTypeDAO()
    let activityDAO = CoreDataDAOFactory.getInstance().getActivityDAO()
    
    var addActivity = Activity(context: CoreDataManager.context)
    
    @IBAction func validateActivity(_ sender: Any) {
        var i = activityPicker.selectedRow(inComponent: 0)
        
        if(activityPicker.selectedRow(inComponent: 0) != nil && minutesTimesDuration != nil && hourTimeDuration != nil){
            addActivity.activityName = activityTypeNameTab[i]
            addActivity.activityDurationH = minutesTimesDuration.text
            addActivity.activityDurationMin = hourTimeDuration.text
            
            
            do{
                try activityDAO.save()
                performSegue(withIdentifier: "unwindToActivities", sender: self)
            }catch let error as NSError {
                ManageErrorHelper.alertError(view: self, error: error)
            }
        }        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityPicker.delegate = self
        activityPicker.dataSource = self


        
        loadData()
        
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
    
    func loadData(){
        do{
            var activityTypes : [ActivityType] = [ActivityType]()
            
            activityTypes = try activityTypeDAO.getAll() as! [ActivityType]
            
            if(activityTypes != []){
                for _ in (activityTypes){
                    if(activityTypes.first?.activityTypeName != nil){
                        
                        let type: String = (activityTypes.first?.activityTypeName)!
                        activityTypeNameTab.append(type)
                        activityTypes.removeFirst()
                        
                    }
                }
            }
        }catch let error as NSError {
            ManageErrorHelper.alertError(view: self, error: error)
        }
    }
    
    @IBAction func unwindToAddActivity(segue: UIStoryboardSegue){
        
        loadData()
    }


}
