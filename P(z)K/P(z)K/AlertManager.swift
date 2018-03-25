//
//  AlertePreRDV.swift
//  P(z)K
//
//  Created by Thais Aurard on 25/03/2018.
//  Copyright © 2018 Thais AURARD. All rights reserved.
//

import UIKit
import Foundation
import CoreData

extension UIViewController {
    
    func alert(message: String, title: String, type : String) {
        
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        
        if(type == "suivi"){
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "StateViewController") as! StateViewController
            
            
            let OKAction = UIAlertAction(title: "OK", style: .default, handler: {_ in  self.present(newViewController, animated: true, completion: nil)})
            
            alertController.addAction(OKAction)
            
            self.present(alertController, animated: true, completion: nil)
        
        }else{
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
}
