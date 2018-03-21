//
//  CoreDataManager.swift
//  P(z)K
//
//  Created by Thais Aurard on 19/03/2018.
//  Copyright © 2018 Thais AURARD. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class CoreDataManager{
   /* static var context : NSManagedObjectContext = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Erreur application")
        }
        return appDelegate.persistentContainer.viewContext
    }()*/
    
    static var context : NSManagedObjectContext{
        //get context of persistent data
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Erreur Application")
        }
        return appDelegate.persistentContainer.viewContext
    }
    
  /*  @discardableResult
    class func save() -> NSError?{
        do{
            try CoreDataManager.context.save()
            return nil
        }catch let error as NSError{
            return error
        }
    }*/
}

