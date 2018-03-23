//
//  ActivityForm.swift
//  P(z)K
//
//  Created by Thais AURARD on 23/03/2018.
//  Copyright © 2018 Thais AURARD. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ActivityForm : UIViewController, UIPickerViewDelegate{
    
    var pickerData : [String] = [String]()

    
    @IBOutlet weak var ActivityTypePicker: UIPickerView!
    
    @IBOutlet weak var NewActivityType: UITextField!
    
    
    @IBOutlet weak var DurationH: UITextField!
    
    @IBOutlet weak var DurationMin: UITextField!
    
    
    @IBAction func ValidateAddActivity(_ sender: Any) {
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
