//
//  ViewController.swift
//  P(z)K
//
//  Created by Thais AURARD on 28/02/2018.
//  Copyright © 2018 Thais AURARD. All rights reserved.
//

import UIKit
import Foundation
import CoreData
import UserNotifications

class RegistrationController: UIViewController, UITableViewDelegate {
    
    
    var patient : String = "";
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let center = UNUserNotificationCenter.current()
        let options: UNAuthorizationOptions = [.alert, .sound]
      
        center.getNotificationSettings { (settings) in
                if settings.authorizationStatus != .authorized {
                    center.requestAuthorization(options: options) {
                        (granted, error) in
                        if !granted {
                            print("Something went wrong")
                        }
                    }
                }
        }
        
        let pkLogo: UIImage = UIImage(named: "monpketmoi")!
        logoRegistrationView.image = pkLogo
    }
    
    
    
    @IBOutlet weak var UserFirstNameField: UITextField!
    
    @IBOutlet weak var UserLastNameField: UITextField!
    
    @IBOutlet weak var ValidateNameFields: UIButton!
    
    @IBOutlet weak var logoRegistrationView: UIImageView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (UserLastNameField.text != nil && UserFirstNameField.text != nil){
           
            patient = "Bonjour " + UserLastNameField.text!;
            patient += " ";
            patient += UserFirstNameField.text!;
            
            let data = UILabel()
            data.text = patient
            let firstname = UserFirstNameField.text
            let lastname = UserLastNameField.text
            self.savePatient(firstName: firstname!, lastName: lastname!)
            
            
            if let AccueilController = segue.destination as? AccueilController {
                
                AccueilController.data = data.text
            }
            
        }
    }
    
    
    func savePatient(firstName : String, lastName : String){
        let patientt = Patient(context: CoreDataManager.context)
        patientt.lastName = lastName
        patientt.firstName = firstName
        
        do{
            try CoreDataManager.context.save()
        }catch let error as NSError{
            ManageErrorHelper.alertError(view: self, error: error)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

