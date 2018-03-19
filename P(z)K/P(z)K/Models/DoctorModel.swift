//
//  UserModel.swift
//  P(z)K
//
//  Created by Thais Aurard on 15/03/2018.
//  Copyright © 2018 Thais AURARD. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import Brouillon

class DoctorModel{
    var doctorFirstName : String = ""
    var doctorLastName : String = ""
    var doctorAddr : Address = ""
    var doctorNumTel : String = ""

    
    init(doctorFirstName : String, doctorLastName : String, doctorAddr : Address, doctorNumTel : String){
        self.doctorFirstName = doctorfirstName
        self.doctorLastName = doctorLastName
        self.doctorAddr = doctorAddr
        self.doctorNumTel = doctorNumTel
    }
}



