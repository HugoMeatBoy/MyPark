//
//  Brouillon.swift
//  P(z)K
//
//  Created by Thais Aurard on 18/03/2018.
//  Copyright © 2018 Thais AURARD. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class Address {
    var num : String = ""
    var street : String = ""
    var postal : String = ""
    var city : String = ""
    
    
    init(num : String, street: String, postal : String, city : String){
        self.num = num
        self.street = street
        self.postal = postal
        self.city = city
    }
}
