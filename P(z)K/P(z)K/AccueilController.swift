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
        
        
        //SI L'APP EST INACTIVE > Notification iOS
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
        
   
        //SI L'APP EST ACTIVE - ASYNCHRONE >>>> Decomment to tests
      
    /*    let group = DispatchGroup()
        group.enter()
        
        DispatchQueue.main.async {
            if(self.actualStateFilled == nil || self.actualStateFilled == false){
                sleep(10)
                self.alert(message: "Veuillez indiquer votre état actuel", title: "Suivi pré RDV", type: "suivi")
            }
            group.leave()
        }
        
        // does not wait. But the code in notify() gets run
        // after enter() and leave() calls are balanced
       
        group.notify(queue: .main) {
            
        }
 */
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
   
    func selectState(){
       
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

