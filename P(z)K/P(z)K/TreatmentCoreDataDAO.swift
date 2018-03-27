//
//  TreatmentDAOPostgres.swift
//  P(z)K
//
//  Created by Thais Aurard on 27/03/2018.
//  Copyright © 2018 Thais AURARD. All rights reserved.
//

import Foundation
import CoreData

class TreatmentCoreDataDAO : CoreDataDAO, TreatmentDAO{
    
    func create() throws -> Treatment {
        return Treatment(context: self.context)
    }
    
    func delete(obj: Treatment) {
        self.context.delete(obj)
        do{
            try self.context.save()
        }catch let error {
            print(error)
        }
        
    }
    
    func getAll() throws -> [Treatment?] {
        var treatments: [Treatment] = []
        let request: NSFetchRequest<Treatment> = NSFetchRequest(entityName: "Treatment")
        do {
            treatments = try self.context.fetch(request)
        } catch let error {
            throw error
        }
        return treatments
    }
    
    // MARK: custom methods
    func get() throws -> Treatment? {
        var treatments: [Treatment] = []
        do {
            treatments = try self.getAll() as! [Treatment]
        } catch let error {
            throw error
        }
        if(treatments.count > 0) {
            return treatments.first
        }
        else {
            return nil
        }
    }
    
}
