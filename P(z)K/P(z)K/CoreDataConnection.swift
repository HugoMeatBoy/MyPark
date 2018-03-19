//
//  CoreDataConnection.swift
//  P(z)K
//
//  Created by Thais Aurard on 19/03/2018.
//  Copyright © 2018 Thais AURARD. All rights reserved.
//

import CoreData
import UIKit
import Foundation

class CoreDataConnection: NSObject {
    
    
    func getContext() -> NSManagedObjectContext {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Error getting app delegate.")
        }
        let context = appDelegate.persistentContainer.viewContext
        return context
    }
    
}
