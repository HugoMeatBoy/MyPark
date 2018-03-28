//
//  EventCoreDataDAO.swift
//  P(z)K
//
//  Created by Thais Aurard on 28/03/2018.
//  Copyright © 2018 Thais AURARD. All rights reserved.
//

import Foundation
import CoreData

class EventCoreDataDAO : CoreDataDAO, EventDAO{

    func create() throws -> Event {
        return Event(context: self.context)
    }
    
    func delete(obj: Event) {
        self.context.delete(obj)
        do{
            try self.context.save()
        }catch let error {
            print(error)
        }
        
    }
    
    func getAll() throws -> [Event?] {
        var events: [Event] = []
        let request: NSFetchRequest<Event> = NSFetchRequest(entityName: "Event")
        do {
            events = try self.context.fetch(request)
        } catch let error {
            throw error
        }
        return events
    }
    
    // MARK: custom methods
    func get() throws -> Event? {
        var events: [Event] = []
        do {
            events = try self.getAll() as! [Event]
        } catch let error {
            throw error
        }
        if(events.count > 0) {
            return events.first
        }
        else {
            return nil
        }
    }
    
}
