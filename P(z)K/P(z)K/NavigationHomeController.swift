//
//  NavigationHomeController.swift
//  P(z)K
//
//  Created by Hugo FAZIO on 20/03/2018.
//  Copyright © 2018 Thais AURARD. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class NavigationHomeController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var patientL : [Patient]?
        
        let request : NSFetchRequest<Patient> = Patient.fetchRequest()
        
        do {
            patientL = try CoreDataManager.context.fetch(request)
        } catch let error as NSError {
            ManageErrorHelper.alertError(view: self, error: error)
        }
        
        if(patientL?.first != nil){
            print(patientL?.first?.firstName as Any)
            
            self.performSegue(withIdentifier: "HomeSegue", sender: self)
            
        }else{
            
            //--------------MEDECINE----------------
            
            //--------------------------------------
            
            self.performSegue(withIdentifier: "LoginSegue", sender: self)
        }
        
    }
    
}
