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
    
    var medsName: [String] = [String]()
    
    var medsDoses: [String] = [String]()
    
    @IBOutlet weak var MedicPicker: UIPickerView!
    
    @IBOutlet weak var MedicValidation: UIButton!
    
    @IBAction func MedicValidate(_ sender: Any) {
        
    }
    
 
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MedicPicker.delegate = self
        MedicPicker.dataSource = self
        
        loadData()
        
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
        return medsName.count
        //return medsName.count
        
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return medsName[row]
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? AgendaMedicDoseForm {
            
            let i = MedicPicker.selectedRow(inComponent: 0)
            
            destination.medecine = medsName[i]
            destination.med = medsDoses[i]
        }
        
    }
    
    func loadData(){
        let medecineDAO = CoreDataDAOFactory.getInstance().getMedecineDAO()
        
        var medecines : [Medecine] = [Medecine]()
        
        do{
            medecines = try medecineDAO.getAll() as! [Medecine]
            
            for _ in (medecines){
                medsName.append(medecines.first?.medecineName as! String)
                medsDoses.append(medecines.first?.medecineDose as! String)
                medecines.removeFirst()
            }
            
        }catch let error as NSError {
            ManageErrorHelper.alertError(view: self, error: error)
        }
    }
    
    @IBAction func unwindToTreatmentForm(segue: UIStoryboardSegue){
        medsName.removeAll()
        medsDoses.removeAll()
        
        print("jjj")
        MedicPicker.delegate = self
        MedicPicker.dataSource = self
        
        loadData()
    }
    
}

