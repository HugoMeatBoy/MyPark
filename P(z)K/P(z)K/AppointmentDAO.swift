//
//  AppointmentDAO.swift
//  P(z)K
//
//  Created by Thais Aurard on 19/03/2018.
//  Copyright © 2018 Thais AURARD. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class AppointmentDAO{
    
    var context : NSManagedObjectContext
    
    
    init() {
        let CDC  = CoreDataConnection()
        self.context = CDC.getContext()
    }
    
    func getAllAppointment() -> [Appointment]? {
        let request: NSFetchRequest<Appointment> = NSFetchRequest(entityName: "Appointment")
        do {
            let appointments:[Appointment] = try self.context.fetch(request)
            return appointments
        } catch {
            print("Error getting all appointments")
            return nil
        }
    }
    
    
    
    
    func addAppointment(appointment : Appointment) {
        do{
            try CoreDataManager.context.save()
        } catch {
            print ("error")
        }
    }
}
 
