//
//  AgendaMedecineForm.swift
//  P(z)K
//
//  Created by Thais Aurard on 28/03/2018.
//  Copyright © 2018 Thais AURARD. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class AgendaMedecineForm: UIViewController {
    
    
    @IBOutlet weak var medecineName: UITextField!
    
    @IBOutlet weak var medecineDoses: UITextField!
    
    
    let newMedecine = Medecine(context: CoreDataManager.context)
    let medecineDAO = CoreDataDAOFactory.getInstance().getMedecineDAO()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func ValidateNewMedecine(_ sender: Any) {
        
        if(medecineName.text != nil && medecineDoses.text != nil){
            
            
            
            newMedecine.medecineName = medecineName.text
            newMedecine.medecineDose = medecineDoses.text
            
            
            
            do {
                try medecineDAO.save()
                
            } catch let error as NSError{
                print(error)
            }
            
            performSegue(withIdentifier: "unwindSegueNewTreatment", sender: self)
            
        }
        
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
