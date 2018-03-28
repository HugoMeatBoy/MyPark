//
//  MotorStateCoreDataDAO.swift
//  P(z)K
//
//  Created by Thais Aurard on 28/03/2018.
//  Copyright © 2018 Thais AURARD. All rights reserved.
//


import Foundation
import CoreData

class MotorStateCoreDataDAO : CoreDataDAO, MotorStateDAO{
    
    func create() throws -> MotorState {
        return MotorState(context: self.context)
    }
    
    func delete(obj: MotorState) {
        self.context.delete(obj)
        do{
            try self.context.save()
        }catch let error {
            print(error)
        }
        
    }
    
    func getAll() throws -> [MotorState?] {
        var motorstates: [MotorState] = []
        let request: NSFetchRequest<MotorState> = NSFetchRequest(entityName: "MotorState")
        do {
            motorstates = try self.context.fetch(request)
        } catch let error {
            throw error
        }
        return motorstates
    }
    
    // MARK: custom methods
    func get() throws -> MotorState? {
        var motorstates: [MotorState] = []
        do {
            motorstates = try self.getAll() as! [MotorState]
        } catch let error {
            throw error
        }
        if(motorstates.count > 0) {
            return motorstates.first
        }
        else {
            return nil
        }
    }
    
}

