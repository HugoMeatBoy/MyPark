//
//  NavigationNotificationController.swift
//  P(z)K
//
//  Created by Thais Aurard on 24/03/2018.
//  Copyright © 2018 Thais AURARD. All rights reserved.
//

import UIKit
import Foundation
import CoreData
import UserNotifications

class NavigationNotificationController: UINavigationController {
    
    let center = UNUserNotificationCenter.current()
    
    let options: UNAuthorizationOptions = [.alert, .sound]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
       let content = UNMutableNotificationContent()
        content.title = "Veuillez indiquer votre état actuel"
        content.body = "RDV dans 2 jours - ON/OFF/DYS"
        content.sound = UNNotificationSound.default()
        
        
        
        let date = Date(timeIntervalSinceNow: 120)
        let triggerDate = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second,], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate,
                                                    repeats: true)
        
        let requestTest = UNNotificationRequest(identifier: "stateNotification", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(requestTest, withCompletionHandler: nil)
        
      
    }
    
}
