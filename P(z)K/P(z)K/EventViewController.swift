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
    
    @IBOutlet weak var TypeEventPicker: UIPickerView!
    
    @IBOutlet weak var DateEventPicker: UIDatePicker!
    
    @IBOutlet weak var EventValidation: UIButton!
    
    @IBAction func ValidateEvent(_ sender: Any) {
    }
}
