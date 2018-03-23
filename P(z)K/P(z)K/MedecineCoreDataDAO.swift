//
//  MedecineCoreDataDAO.swift
//  P(z)K
//
//  Created by Thais Aurard on 23/03/2018.
//  Copyright © 2018 Thais AURARD. All rights reserved.
//

import Foundation
import CoreData

class MedecineCoreDataDAO: CoreDataDAO, MedecineDAO {

    
    
    func create() throws -> Medecine {
        return Medecine(context: self.context)
    }
    
    func delete(obj: Medecine) {
        self.context.delete(obj)
        do{
            try self.context.save()
        }catch let error {
            print(error)
        }
        
    }
    
    func getAll() throws -> [Medecine?] {
        var medecines: [Medecine] = []
        let request: NSFetchRequest<Medecine> = NSFetchRequest(entityName: "Medecine")
        do {
            medecines = try self.context.fetch(request)
        } catch let error {
            throw error
        }
        return medecines
    }
    
    // MARK: custom methods
    func get() throws -> Medecine? {
        var medecines: [Medecine] = []
        do {
            medecines = try self.getAll() as! [Medecine]
        } catch let error {
            throw error
        }
        if(medecines.count > 0) {
            return medecines.first
        }
        else {
            return nil
        }
    }
    
}
