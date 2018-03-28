//
//  AlertePreRDV.swift
//  P(z)K
//
//  Created by Thais Aurard on 25/03/2018.
//  Copyright © 2018 Thais AURARD. All rights reserved.
//


import Foundation
import UserNotifications
import UIKit

class AlertManager{
    private static var instance: AlertManager?
    
    
    init() {
        
    }
    
    // Singleton pattern
    static func getInstance() -> AlertManager {
        guard let instanceAlertManager = AlertManager.instance else {
            return AlertManager()
        }
        return instanceAlertManager
    }
    
   /* func createStateNotification(date : Date){
    }
    */
    
    func createRdvNotification(date : DateComponents, titre : String, doctor: String){
        
        
        let content = UNMutableNotificationContent()
        content.title="Alarme Rendez-Vous"
        content.body="Dr" + doctor
      
        let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: false)
        let request = UNNotificationRequest(identifier: "any", content: content, trigger: trigger)
       
        
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }

}
