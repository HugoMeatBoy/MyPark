//
//  AgendaMedicDoseForm.swift
//  P(z)K
//
//  Created by Thais Aurard on 26/03/2018.
//  Copyright © 2018 Thais AURARD. All rights reserved.
//

//
//  AgendaMedicDoseForm.swift
//  P(z)K
//
//  Created by Hugo FAZIO on 26/03/2018.
//  Copyright © 2018 Thais AURARD. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class AgendaMedicDoseForm: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    var medDoses: [String] = [String]()
    
    var med: String = String()
    
    @IBOutlet weak var DosagePicker: UIPickerView!
    
    @IBOutlet weak var NbJoursTraitement: UITextField!
    
    @IBOutlet weak var NbPrisesParJour: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DosagePicker.delegate = self
        DosagePicker.dataSource = self
        
        medDoses = med.components(separatedBy: ",")
        
        
        print(medDoses)
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
        return medDoses.count
        
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return medDoses[row]
        
        // or simply:
        // let fullNameArr = fullName.characters.split{" "}.map(String.init)
        // Last
        
    }
}

