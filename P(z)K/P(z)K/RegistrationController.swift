//
//  ViewController.swift
//  P(z)K
//
//  Created by Thais AURARD on 28/02/2018.
//  Copyright © 2018 Thais AURARD. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class RegistrationController: UIViewController, UITableViewDelegate {
    
    
    var patient : String = "";
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    
    
    @IBOutlet weak var UserFirstNameField: UITextField!
    
    @IBOutlet weak var UserLastNameField: UITextField!
    
    @IBOutlet weak var ValidateNameFields: UIButton!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        /*guard let appDelegate = UIApplication.shared.delegate as? AppDelegate
         else {
         return
         }*/
        //let managedContext = appDelegate.persistentContainer.viewContext
        
        //let userEntity = NSEntityDescription.entity(forEntityName: "User", in: managedContext)!
        
        if (UserLastNameField.text != nil && UserFirstNameField.text != nil){
            //let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
            //user.setValue(UserLastNameField.text, forKeyPath: "lastName")
            //user.setValue(UserFirstNameField.text, forKey: "firstName")
            
            patient = "Bonjour " + UserLastNameField.text!;
            patient += " ";
            patient += UserFirstNameField.text!;
            
            let data = UILabel()
            data.text = patient
            let firstname = UserFirstNameField.text
            let lastname = UserLastNameField.text
            self.savePatient(firstName: firstname!, lastName: lastname!)
            
            /*patientt.lastName = UserLastNameField.text
             patientt.firstName = UserFirstNameField.text*/
            
            /* do{
             try CoreDataManager.save()
             }catch let error as NSError{
             ManageErrorHelper.alertError(view: self, error: error)
             }*/
            
            if let AccueilController = segue.destination as? AccueilController {
                
                AccueilController.data = data.text
            }
            
        }
    }
    
    func alertError(errorMsg error : String, userInfo user : String = ""){
        let alert = UIAlertController(title: error,
                                      message: user,
                                      preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Ok",
                                         style: .default)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    /*
     func saveNewPatient(withName lastName: String){
     guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
     self.alertError(errorMsg: "Could not save Patient", userInfo: "unknown reason")
     return
     }
     let context = appDelegate.persistentContainer.viewContext
     let pati = Patientt(context: context)
     pati.lastName = lastName
     do{
     try context.save()
     }
     catch let error as NSError{
     self.alertError(errorMsg: "\(error)", userInfo: "\(error.userInfo)")
     return
     }
     }
     */
    func savePatient(firstName : String, lastName : String){
        let patientt = Patient(context: CoreDataManager.context)
        patientt.lastName = lastName
        patientt.firstName = firstName
        
        do{
            try CoreDataManager.context.save()
        }catch let error as NSError{
            ManageErrorHelper.alertError(view: self, error: error)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

