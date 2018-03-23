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
    typealias MedecineDAO = MedecineCoreDataDAO
    typealias DoctorDAO = DoctorCoreDataDAO
    typealias AppointmentDAO = AppointmentCoreDataDAO
    
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
    
    func getMedecineDAO() -> MedecineCoreDataDAO {
        return MedecineCoreDataDAO()
    }
   
    func getDoctorDAO() -> DoctorCoreDataDAO {
        return DoctorCoreDataDAO()
    }
    
    func getAppointmentDAO() -> AppointmentCoreDataDAO {
        return AppointmentCoreDataDAO()
    }
    /*
    func getExerciseDAO() -> CDExerciseDAO {
        return CDExerciseDAO()
    }
 */
}
