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
    
    let newDoctorVar = Doctor(context: CoreDataManager.context)
    let doctorDAO = CoreDataDAOFactory.getInstance().getDoctorDAO()
    
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
    
    @IBAction func ValidateDoctor(_ sender: Any) {
        if(doctorAdress.text != nil && travelDuration.text != nil && doctorNum.text != nil){
            
            newDoctorVar.doctorLastName = doctorName
            newDoctorVar.doctorNumTel = doctorNum.text
            newDoctorVar.doctorAddress = doctorAdress.text
            
            
            do{
                try doctorDAO.save()
            } catch let error as NSError{
                ManageErrorHelper.alertError(view: self, error: error)
            }
        }
    }
}
