//
//  EventViewController.swift
//  P(z)K
//
//  Created by Hugo FAZIO on 19/03/2018.
//  Copyright © 2018 Thais AURARD. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class EventViewController: UIViewController{
    
    let newEvent = Event(context:CoreDataManager.context)
    
    @IBOutlet weak var nameEvent: UITextField!
    
    @IBOutlet weak var DateEventPicker: UIDatePicker!
    
    @IBOutlet weak var EventValidation: UIButton!
    
    @IBAction func ValidateEvent(_ sender: Any) {
        let date = Date()
        if(DateEventPicker.date <= date - 1){
            
            newEvent.eventDate = DateEventPicker.date as NSDate
            newEvent.eventName = nameEvent.text
            do{
                try CoreDataManager.context.save()
               
            }catch let error as NSError{
                ManageErrorHelper.alertError(view: self, error: error)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
       
    }
}
