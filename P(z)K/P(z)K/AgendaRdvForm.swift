//
//  AgendaRdvForm.swift
//  P(z)K
//
//  Created by Hugo FAZIO on 19/03/2018.
//  Copyright © 2018 Thais AURARD. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class AgendaRdvForm: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    
    var doctorNameTab: [String] = [String]()
    var pickerData: [String] = [String]()
    var newAppointment: Appointment!
   
    
    @IBOutlet weak var DocteurPicker: UIPickerView!
    
    @IBOutlet weak var RdvDatePicker: UIDatePicker!
    
    @IBOutlet weak var RdvValidation: UIButton!
    
    @IBAction func ValidateRdv(_ sender: Any) {
        var i = DocteurPicker.selectedRow(inComponent: 0)
        
        
        let newAppointment = Appointment(context:CoreDataManager.context)
        
        
        newAppointment.doctorLastName = doctorsFactory[i].doctorLastName
        
        newAppointment.appointmentDate = RdvDatePicker.date as NSDate
        
        
        do{
            try CoreDataManager.context.save()
            performSegue(withIdentifier: "unwindToAgenda", sender: self)
        }catch let error as NSError{
            ManageErrorHelper.alertError(view: self, error: error)
        }
        
    }
    
    
    var doctors : [Doctor] = [Doctor]()
    var doctorsFactory : [Doctor] = [Doctor]()
    let doctorDAO = CoreDataDAOFactory.getInstance().getDoctorDAO()
    let appointmentDAO = CoreDataDAOFactory.getInstance().getAppointmentDAO()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        DocteurPicker.delegate = self
        DocteurPicker.dataSource = self


        
        do{
            doctors = try doctorDAO.getAll() as! [Doctor]
            doctorsFactory = doctors
            
            for _ in (doctors){
                doctorNameTab.append(doctors.first?.doctorLastName as! String)
                doctors.removeFirst()
            }
        }catch let error as NSError {
            ManageErrorHelper.alertError(view: self, error: error)
        }
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
        return doctorNameTab.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return doctorNameTab[row]
    }
}
