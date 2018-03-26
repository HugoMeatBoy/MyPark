//
//  AddActivityTypeViewController.swift
//  P(z)K
//
//  Created by Thais Aurard on 26/03/2018.
//  Copyright © 2018 Thais AURARD. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class AddActivityTypeViewController: UIViewController {

    
    @IBOutlet weak var NewActivityTypeName: UITextField!
    
    var newActivityTypeVar : ActivityType!
    let activityTypeDAO = CoreDataDAOFactory.getInstance().getActivityDAO()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
        
        if(NewActivityTypeName.text != nil){
            newActivityTypeVar.activityTypeName = NewActivityTypeName.text

            }
            
        }

    
    @IBAction func ValidateNewActivityTypeName(_ sender: Any) {
        do {
            try activityTypeDAO.save()
        } catch let error as NSError{
            ManageErrorHelper.alertError(view: self, error: error)
        }
    
        
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