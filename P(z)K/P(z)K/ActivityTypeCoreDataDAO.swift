//
//  ActivityTypeCoreDataDAO.swift
//  P(z)K
//
//  Created by Thais Aurard on 26/03/2018.
//  Copyright © 2018 Thais AURARD. All rights reserved.
//


import Foundation
import CoreData

class ActivityTypeCoreDataDAO : CoreDataDAO, ActivityTypeDAO {
    
    func create() throws -> ActivityType {
        return ActivityType(context: self.context)
    }
    
    func delete(obj: ActivityType) {
        self.context.delete(obj)
        do{
            try self.context.save()
        }catch let error {
            print(error)
        }
        
    }
    
    func getAll() throws -> [ActivityType?] {
        var activityTypes: [ActivityType] = []
        let request: NSFetchRequest<ActivityType> = NSFetchRequest(entityName: "ActivityType")
        do {
            activityTypes = try self.context.fetch(request)
        } catch let error {
            throw error
        }
        return activityTypes
    }
    
    // MARK: custom methods
    func get() throws -> ActivityType? {
        var activityTypes: [ActivityType] = []
        do {
            activityTypes = try self.getAll() as! [ActivityType]
        } catch let error {
            throw error
        }
        if(activityTypes.count > 0) {
            return activityTypes.first
        }
        else {
            return nil
        }
    }
    
    
}

