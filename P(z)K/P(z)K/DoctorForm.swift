//
//  DoctorForm.swift
//  P(z)K
//
//  Created by Thais AURARD on 23/03/2018.
//  Copyright © 2018 Thais AURARD. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DoctorForm : UIViewController, UIPickerViewDelegate{
    
    @IBOutlet weak var NewDoctorLastName: UITextField!
    
    @IBOutlet weak var NewDoctorFirstName: UITextField!
    
    @IBOutlet weak var SpecialityPicker: UIPickerView!
    
    @IBOutlet weak var NewSpeciality: UITextField!
    
    @IBOutlet weak var NewDoctorNum: UITextField!
    
  //  @IBOutlet weak var NewDoctorAddress: UITextField! 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
           override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
