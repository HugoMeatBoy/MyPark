//
//  ActivityCoreDataDAO.swift
//  P(z)K
//
//  Created by Thais AURARD on 23/03/2018.
//  Copyright © 2018 Thais AURARD. All rights reserved.
//

import Foundation
import CoreData

class ActivityCoreDataDAO : CoreDataDAO, ActivityDAO {
    
    func create() throws -> Activity {
        return Activity(context: self.context)
    }
    
    func delete(obj: Activity) {
        self.context.delete(obj)
        do{
            try self.context.save()
        }catch let error {
            print(error)
        }
        
    }
    
    func getAll() throws -> [Activity?] {
        var activities: [Activity] = []
        let request: NSFetchRequest<Activity> = NSFetchRequest(entityName: "Activity")
        do {
            activities = try self.context.fetch(request)
        } catch let error {
            throw error
        }
        return activities
    }
    
    // MARK: custom methods
    func get() throws -> Activity? {
        var activities: [Activity] = []
        do {
            activities = try self.getAll() as! [Activity]
        } catch let error {
            throw error
        }
        if(activities.count > 0) {
            return activities.first
        }
        else {
            return nil
        }
    }

    
}
