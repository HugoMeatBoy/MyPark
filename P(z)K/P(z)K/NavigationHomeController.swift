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
        modopar.medecineDose = "62.5,125,250"
        
        let doliprane = Medecine(context: CoreDataManager.context)
        doliprane.medecineName = "SINEMET"
        doliprane.medecineDose = "100,250"
        
        let sta = Medecine(context: CoreDataManager.context)
        sta.medecineName = "STALEVO"
        sta.medecineDose = "50,75,100,125,150,175,200"
        
        let par = Medecine(context: CoreDataManager.context)
        par.medecineName = "PARLODEL"
        par.medecineDose = "2.5,5,10"
        
        let tri = Medecine(context: CoreDataManager.context)
        tri.medecineName = "TRIVASTAL"
        tri.medecineDose = "20"
        
        
        let sifrol = Medecine(context: CoreDataManager.context)
        sifrol.medecineName = "SIFROL"
        sifrol.medecineDose = "0.18,0.7"
        
        do{
            try CoreDataManager.context.save()
        }catch let error as NSError{
            ManageErrorHelper.alertError(view: self, error: error)
        }
    }
    
}
