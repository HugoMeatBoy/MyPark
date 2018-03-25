//
//  StateViewController.swift
//  P(z)K
//
//  Created by Thais Aurard on 24/03/2018.
//  Copyright © 2018 Thais AURARD. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class StateViewController: UIViewController{
    
    @IBOutlet weak var OnButton: UIButton!
    @IBOutlet weak var OffButton: UIButton!
    @IBOutlet weak var DyskynesiesButton: UIButton!
    
    @IBAction func OnButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "StateHomeSegue", sender: self)
    }
    
    @IBAction func OffButtonPressed(_ sender: Any) {
            performSegue(withIdentifier: "StateHomeSegue", sender: self)
    }
    
    @IBAction func DyskynesiesButtonPressed(_ sender: Any) {
            performSegue(withIdentifier: "StateHomeSegue", sender: self)
    }
    
    
    
}
