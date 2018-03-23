//
//  AppointmentCoreDataDAO.swift
//  P(z)K
//
//  Created by Thais AURARD on 23/03/2018.
//  Copyright © 2018 Thais AURARD. All rights reserved.
//

import Foundation
import CoreData

class AppointmentCoreDataDAO : CoreDataDAO, AppointmentDAO{
    
    func create() throws -> Appointment {
        return Appointment(context: self.context)
    }
    
    func delete(obj: Appointment) {
        self.context.delete(obj)
        do{
            try self.context.save()
        }catch let error {
            print(error)
        }
        
    }
    
    func getAll() throws -> [Appointment?] {
        var appointments: [Appointment] = []
        let request: NSFetchRequest<Appointment> = NSFetchRequest(entityName: "Appointment")
        do {
            appointments = try self.context.fetch(request)
        } catch let error {
            throw error
        }
        return appointments
    }
    
    // MARK: custom methods
    func get() throws -> Appointment? {
        var appointments: [Appointment] = []
        do {
            appointments = try self.getAll() as! [Appointment]
        } catch let error {
            throw error
        }
        if(appointments.count > 0) {
            return appointments.first
        }
        else {
            return nil
        }
    }
    
}
