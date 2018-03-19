//
//  UserModel.swift
//  P(z)K
//
//  Created by Thais Aurard on 15/03/2018.
//  Copyright © 2018 Thais AURARD. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class PatientModel{
    var firstName : String
    var lastName : String
    
  /* private let dao : PatientModel
     var firstName : String{
        get{
            return self.dao.firstName!
        }
        set{
            self.dao.firstName = newValue
        }
    }
    var lastName : String{
        get{
            return self.dao.lastName!
        }
        set{
            self.dao.lastName = newValue
        }
    }
    */
    

   init(firstName : String, lastName : String){
        /*self.dao.firstName.set(firstName)
        self.dao.lastName.set(lastName)*/
    self.firstName = firstName
    self.lastName  = lastName
    
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate
        else {
            return
    }
   let managedContext = appDelegate.persistentContainer.viewContext
    let patientEntity = NSEntityDescription.entity(forEntityName: "Patient", in: managedContext)!
    
   
        let patient = NSManagedObject(entity: patientEntity, insertInto: managedContext)
        patient.setValue(lastName, forKeyPath: "lastName")
        patient.setValue(firstName, forKey: "firstName")
    
    

    

    }
}


