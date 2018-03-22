//
//  DoctorDAO.swift
//  P(z)K
//
//  Created by Thais Aurard on 20/03/2018.
//  Copyright © 2018 Thais AURARD. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DoctorDAO{
    
    var context : NSManagedObjectContext
    
    
    init() {
        let CDC  = CoreDataConnection()
        self.context = CDC.getContext()
    }
    
    func getAllDoctors() -> [Doctor]? {
        let request: NSFetchRequest<Doctor> = NSFetchRequest(entityName: "Doctor")
        do {
            let doctors:[Doctor] = try self.context.fetch(request)
            return doctors
        } catch {
            print("Error getting all doctors")
            return nil
        }
    }
    
    
    
    
    func addDoctor(doctor : Doctor) {
        do{
        try CoreDataManager.context.save()
        } catch {
            print ("Error adding doctor")
        }
    }
    
    func deleteDoctor(doctor: Doctor) {
        self.context.delete(doctor)
    }
}

