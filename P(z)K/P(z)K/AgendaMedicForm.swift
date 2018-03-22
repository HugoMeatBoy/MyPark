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

class AgendaMedicForm: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    var pickerData: [String] = [String]()
    
    @IBOutlet weak var MedicPicker: UIPickerView!
    
    @IBOutlet weak var DosagePicker: UIPickerView!
    
    @IBOutlet weak var NbJoursMedic: UITextField!
    
    @IBOutlet weak var PrisesJourMedic: UITextField!
    
    @IBOutlet weak var MedicValidation: UIButton!
    
    @IBAction func MedicValidate(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MedicPicker.delegate = self
        MedicPicker.dataSource = self
        
        // Input data into the Array:
        pickerData = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6"]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // The number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }

}
