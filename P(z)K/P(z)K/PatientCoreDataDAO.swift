//
//  PatientDAO.swift
//  P(z)K
//
//  Created by Thais Aurard on 20/03/2018.
//  Copyright © 2018 Thais AURARD. All rights reserved.
//

import Foundation
import CoreData

class PatientCoreDataDAO: CoreDataDAO, PatientDAO {
    
    func create() throws -> Patient {
        return Patient(context: self.context)
    }
    
    func delete(obj: Patient) {
        self.context.delete(obj)
    }
    
    func getAll() throws -> [Patient?] {
        var patients: [Patient] = []
        let request: NSFetchRequest<Patient> = NSFetchRequest(entityName: "Patient")
        do {
            patients = try self.context.fetch(request)
        } catch let error {
            throw error
        }
        return patients
    }
    
    // MARK: custom methods
    func get() throws -> Patient? {
        var patients: [Patient] = []
        do {
            patients = try self.getAll() as! [Patient]
        } catch let error {
            throw error
        }
        if(patients.count > 0) {
            return patients.first
        }
        else {
            return nil
        }
    }
    
}

