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

class ViewController: UIViewController, UITableViewDelegate {

    
    var patient : String = "";
    



    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }


    
    @IBOutlet weak var UserFirstNameField: UITextField!
    
    @IBOutlet weak var UserLastNameField: UITextField!
    
    @IBOutlet weak var ValidateNameFields: UIButton!

    

    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate
            else {
                return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: "User", in: managedContext)!
        
        if (UserLastNameField.text != nil && UserFirstNameField.text != nil){
            let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
            user.setValue(UserLastNameField.text, forKeyPath: "lastName")
            user.setValue(UserFirstNameField.text, forKey: "firstName")
            
            patient = "Bonjour " + UserLastNameField.text!;
            patient += " ";
            patient += UserFirstNameField.text!;
            
            let data = UILabel()
            data.text = patient
            
            if let AccueilViewController = segue.destination as? AccueilViewController {
                
                AccueilViewController.data = data.text
            }

        }
}
 
    

    


   
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
