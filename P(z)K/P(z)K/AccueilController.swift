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
    
    let center = UNUserNotificationCenter.current()
    
    let options: UNAuthorizationOptions = [.alert, .sound]
    
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
        
        let content = UNMutableNotificationContent()
        content.title = "Veuillez indiquer votre état actuel"
        content.body = "RDV dans 2 jours - ON/OFF/DYS"
        content.sound = UNNotificationSound.default()
        
        
        
        let date = Date(timeIntervalSinceNow: 10)
        let triggerDate = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second,], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate,
                                                    repeats: false)
        
        let requestTest = UNNotificationRequest(identifier: "stateNotification", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(requestTest, withCompletionHandler: nil)
        
   
        
      
        /*   let date = Date(timeIntervalSinceNow: 3600)
        let triggerDate = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second,], from: date)
         
         let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate,
         repeats: false)

         
            SCHEDULING
         
         let identifier = "UYLLocalNotification"
         let request = UNNotificationRequest(identifier: identifier,
         content: content, trigger: trigger)
         center.add(request, withCompletionHandler: { (error) in
         if let error = error {
         // Something went wrong
         }
         })
         */
        
       
        
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

