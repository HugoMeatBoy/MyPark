//
//  PatientDAO.swift
//  P(z)K
//
//  Created by Thais Aurard on 22/03/2018.
//  Copyright © 2018 Thais AURARD. All rights reserved.
//

import Foundation


protocol PatientDAO: DAO {
    typealias Object = Patient
    
    /// Get the first patient in DB.
    ///
    /// - Returns: Patient?, the first patient in DB or nil
    /// - Throws: DB error
    func get() throws -> Patient?
}
