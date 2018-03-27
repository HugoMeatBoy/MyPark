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
    
    
    var specialites: [Speciality] = [Speciality]()
    var specialitesNameTab: [String] = [String]()
    
    @IBOutlet weak var NewDoctorName: UITextField!
    
    let doctorDAO = CoreDataDAOFactory.getInstance().getDoctorDAO()
    let specialiteDAO = CoreDataDAOFactory.getInstance().getSpecialityDAO()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SpecialitePicker.dataSource = self
        SpecialitePicker.delegate = self
        
        do{
            specialites = try specialiteDAO.getAll() as! [Speciality]
            
            for _ in (specialites){
            specialitesNameTab.append(specialites.first?.specialityName as! String)
                
                specialites.removeFirst()
            }
            
            print(specialitesNameTab)
            
        }catch let error as NSError {
            ManageErrorHelper.alertError(view: self, error: error)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return specialitesNameTab.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if(specialitesNameTab != nil){
            return specialitesNameTab[row]
        }else{
            return nil
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var i = SpecialitePicker.selectedRow(inComponent: 0)
        
        if (NewDoctorName.text != nil && specialitesNameTab[i] != nil){
            if let destination = segue.destination as? DoctorDataForm {
                
                destination.doctorName = NewDoctorName.text
                destination.doctorSpecialite = specialitesNameTab[i]
            }
            
        }
            
            
    }
    
    
    
}

