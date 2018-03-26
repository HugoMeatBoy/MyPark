//
//  DoctorDataForm.swift
//  P(z)K
//
//  Created by Thais Aurard on 26/03/2018.
//  Copyright © 2018 Thais AURARD. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DoctorDataForm : UIViewController {
    
    var doctorName: String?
    var doctorSpecialite: String?
    
    @IBOutlet weak var doctorAdress: UITextField!
    
    @IBOutlet weak var travelDuration: UITextField!
    
    @IBOutlet weak var doctorNum: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
