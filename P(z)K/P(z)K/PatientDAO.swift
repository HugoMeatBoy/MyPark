//
//  PatientDAO.swift
//  P(z)K
//
//  Created by Thais Aurard on 20/03/2018.
//  Copyright © 2018 Thais AURARD. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class PatientDAO : DAO {
    
    
   /* func getPatient() -> [Patient]? {
        let request: NSFetchRequest<Patient> = NSFetchRequest(entityName: "Patient")
        do {
            let patient : [Patient] = try self.context.fetch(request)
            return patient
        } catch {
            print("Error getting patient")
            return nil
        }
    }*/
    
    static func getPatient() throws -> Patient? {
        let request : NSFetchRequest<Patient> = Patient.fetchRequest()
        do {
            let patientL = try CoreDataManager.context.fetch(request)
            return patientL.first
        } catch let error as NSError {
            throw error
        }
    }
    
    
    
    func create() throws -> Patient {
        return Patient(context: self.context)
    }
    
    
}

