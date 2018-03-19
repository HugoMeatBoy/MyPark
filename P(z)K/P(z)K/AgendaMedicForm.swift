//
//  AgendaMedicForm.swift
//  P(z)K
//
//  Created by Hugo FAZIO on 19/03/2018.
//  Copyright © 2018 Thais AURARD. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class AgendaMedicForm: UIViewController{
    
    @IBOutlet weak var MedicPicker: UIPickerView!
    
    @IBOutlet weak var DosagePicker: UIPickerView!
    
    @IBOutlet weak var NbJoursMedic: UITextField!
    
    @IBOutlet weak var PrisesJourMedic: UITextField!
    
    @IBOutlet weak var MedicValidation: UIButton!
    
    @IBAction func MedicValidate(_ sender: Any) {
    }
}
