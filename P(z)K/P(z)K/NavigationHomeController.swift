//
//  NavigationHomeController.swift
//  P(z)K
//
//  Created by Hugo FAZIO on 20/03/2018.
//  Copyright © 2018 Thais AURARD. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class NavigationHomeController: UINavigationController {
    //let medecineDAO = CoreDataDAOFactory.getInstance().getExerciseDAO()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let patientDAO = CoreDataDAOFactory.getInstance().getPatientDAO()
       
        var patientEnregistre : Patient? = nil
        
        do{
            patientEnregistre = try patientDAO.get()
         
        }catch let error as NSError {
            ManageErrorHelper.alertError(view: self, error: error)
        }
        
        /*
        var patientL : [Patient]?
        
        let request : NSFetchRequest<Patient> = Patient.fetchRequest()
        */
        
        
        
        if(patientEnregistre != nil){
          
            self.performSegue(withIdentifier: "HomeSegue", sender: self)
            
        }else{
            //--------------MEDECINE----------------
            self.loadMedecines()
            
            //--------------------------------------
            
            self.performSegue(withIdentifier: "LoginSegue", sender: self)
        }
 
        
    }
    
    func loadMedecines(){
        let modopar = Medecine(context: CoreDataManager.context)
        modopar.medecineName = "MODOPAR"
        modopar.medecineDose = "1,2,3"
        
        let doliprane = Medecine(context: CoreDataManager.context)
        doliprane.medecineName = "DOLIPRANE"
        doliprane.medecineDose = "200,500"
        
        do{
            try CoreDataManager.context.save()
        }catch let error as NSError{
            ManageErrorHelper.alertError(view: self, error: error)
        }
    }
    
}
