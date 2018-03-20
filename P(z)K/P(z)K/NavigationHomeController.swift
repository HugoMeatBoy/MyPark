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
    
    var test = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(test){
            self.performSegue(withIdentifier: "HomeSegue", sender: self)
        }else{
            self.performSegue(withIdentifier: "LoginSegue", sender: self)
        }
        
    }
    
}
