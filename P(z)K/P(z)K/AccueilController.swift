//
//  AccueilViewController.swift
//  P(z)K
//
//  Created by Thais AURARD on 28/02/2018.
//  Copyright © 2018 Thais AURARD. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class AccueilController: UIViewController {
    
    var data: String?
    
    @IBOutlet weak var Welcome: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var patientL : [Patient]?
        var pati : Patient?
        
        let request : NSFetchRequest<Patient> = Patient.fetchRequest()
        
        do {
            patientL = try CoreDataManager.context.fetch(request)
        } catch let error as NSError {
            ManageErrorHelper.alertError(view: self, error: error)
        }
        
        if (patientL?.first != nil) {
            pati = patientL?.first
        
            let patientFirstName = (pati?.firstName)!
            
            let patientLastName = (pati?.lastName)!
            
            let dato : String = "Bonjour " + patientFirstName + " " + patientLastName
            
             Welcome.text = dato
        }
        else{
            print ("could not fetch patient")
        }
        
        
        
      
        
        
        /* do{
         let patientL : Patient = try fetchPatient()!
         patientFirstName = (patientL.firstName)!
         patientLastName = (patientL.lastName)!
         } catch let error as NSError {
         ManageErrorHelper.alertError(view: self, error: error)
         }*/
        
       
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var but: UIButton!
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

