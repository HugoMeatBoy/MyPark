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
import UserNotifications

class AccueilController: UIViewController {
    
    var data: String?
    
    var actualStateFilled : Bool?
    
    let center = UNUserNotificationCenter.current()
    
    let options: UNAuthorizationOptions = [.alert, .sound]
    
    @IBOutlet weak var Welcome: UILabel!
    
    @IBOutlet weak var logoHomePage: UIImageView!
    
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
      
        
        
        let pkLogo: UIImage = UIImage(named: "monpketmoi")!
        logoHomePage.image = pkLogo
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}

