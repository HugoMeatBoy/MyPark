//
//  CoreDataDAO.swift
//  P(z)K
//
//  Created by Thais Aurard on 22/03/2018.
//  Copyright © 2018 Thais AURARD. All rights reserved.
//

import Foundation
import CoreData

class CoreDataDAO {
    var context: NSManagedObjectContext
    
    init() {
        let CDC  = CoreDataConnection()
        self.context = CDC.getContext()
    }
    
    // =============================
    
    func save() throws {
        do {
            try context.save()
        } catch let error {
            throw error
        }
        
    }
}
