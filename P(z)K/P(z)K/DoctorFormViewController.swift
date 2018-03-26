//
//  DoctorFormViewController.swift
//  P(z)K
//
//  Created by Thais Aurard on 26/03/2018.
//  Copyright © 2018 Thais AURARD. All rights reserved.
//


import Foundation
import UIKit
import CoreData

class DoctorFormViewController : UIViewController,UIPickerViewDataSource, UIPickerViewDelegate{

    @IBOutlet weak var SpecialitePicker: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SpecialitePicker.dataSource = self
        SpecialitePicker.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return nil
        
    }
    
}

