//
//  CoreDatDAOFactory.swift
//  P(z)K
//
//  Created by Thais Aurard on 22/03/2018.
//  Copyright © 2018 Thais AURARD. All rights reserved.
//

import Foundation

class CoreDataDAOFactory: AbstractDAOFactory {
    
    typealias PatientDAO = PatientCoreDataDAO
    /*typealias PractitionerDAO = CDPractitionerDAO
    typealias SpecialismDAO = CDSpecialismDAO
    */
    private static var instance: CoreDataDAOFactory?
    
    
    init() {}
    
    // Singleton pattern
    static func getInstance() -> CoreDataDAOFactory {
        guard let instanceFactory = CoreDataDAOFactory.instance else {
            return CoreDataDAOFactory()
        }
        return instanceFactory
    }
    
    //MARK: DAOs
    func getPatientDAO() -> PatientCoreDataDAO {
        return PatientCoreDataDAO()
    }
    
  /*  func getPractitionerDAO() -> CDPractitionerDAO {
        return CDPractitionerDAO()
    }
    
    func getSpecialismDAO() -> CDSpecialismDAO {
        return CDSpecialismDAO()
    }
    
    func getAppointmentDAO() -> CDAppointmentDAO {
        return CDAppointmentDAO()
    }
    
    func getExerciseDAO() -> CDExerciseDAO {
        return CDExerciseDAO()
    }
 */
}
