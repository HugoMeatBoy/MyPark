//
//  DoctorCoreDataDAO.swift
//  P(z)K
//
//  Created by Thais AURARD on 23/03/2018.
//  Copyright © 2018 Thais AURARD. All rights reserved.
//

import Foundation
import CoreData

class DoctorCoreDataDAO : CoreDataDAO, DoctorDAO{
    
    func create() throws -> Doctor {
        return Doctor(context: self.context)
    }
    
    func delete(obj: Doctor) {
        self.context.delete(obj)
        do{
            try self.context.save()
        }catch let error {
            print(error)
        }
        
    }
    
    func getAll() throws -> [Doctor?] {
        var doctors: [Doctor] = []
        let request: NSFetchRequest<Doctor> = NSFetchRequest(entityName: "Doctor")
        do {
            doctors = try self.context.fetch(request)
        } catch let error {
            throw error
        }
        return doctors
    }
    
    // MARK: custom methods
    func get() throws -> Doctor? {
        var doctors: [Doctor] = []
        do {
            doctors = try self.getAll() as! [Doctor]
        } catch let error {
            throw error
        }
        if(doctors.count > 0) {
            return doctors.first
        }
        else {
            return nil
        }
    }
    
}
