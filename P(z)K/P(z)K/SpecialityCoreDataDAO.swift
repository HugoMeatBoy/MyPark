//
//  SpecialityCoreDataDAO.swift
//  P(z)K
//
//  Created by Thais Aurard on 26/03/2018.
//  Copyright © 2018 Thais AURARD. All rights reserved.
//

import Foundation
import CoreData

class SpecialityCoreDataDAO : CoreDataDAO, SpecialityDAO{
    
    func create() throws -> Speciality {
        return Speciality(context: self.context)
    }
    
    func delete(obj: Speciality) {
        self.context.delete(obj)
        do{
            try self.context.save()
        }catch let error {
            print(error)
        }
        
    }
    
    func getAll() throws -> [Speciality?] {
        var specialities: [Speciality] = []
        let request: NSFetchRequest<Speciality> = NSFetchRequest(entityName: "Speciality")
        do {
            specialities = try self.context.fetch(request)
        } catch let error {
            throw error
        }
        return specialities
    }
    
    // MARK: custom methods
    func get() throws -> Speciality? {
        var specialities: [Speciality] = []
        do {
            specialities = try self.getAll() as! [Speciality]
        } catch let error {
            throw error
        }
        if(specialities.count > 0) {
            return specialities.first
        }
        else {
            return nil
        }
    }
    
}
