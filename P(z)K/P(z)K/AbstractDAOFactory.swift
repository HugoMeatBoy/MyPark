//
//  AbstractDAOFactory.swift
//  P(z)K
//
//  Created by Thais Aurard on 22/03/2018.
//  Copyright © 2018 Thais AURARD. All rights reserved.
//

import Foundation

protocol AbstractDAOFactory {
    associatedtype PatientDAO
    associatedtype DoctorDAO
    associatedtype MedecineDAO
    associatedtype AppointmentDAO
    associatedtype ActivityTypeDAO
    associatedtype ActivityDAO
    associatedtype SpecialityDAO
    
    // MARK: DAOs
    func getAppointmentDAO() -> AppointmentDAO
    func getDoctorDAO() -> DoctorDAO
    func getMedecineDAO() -> MedecineDAO
    func getPatientDAO() -> PatientDAO
    func getActivityTypeDAO() -> ActivityTypeDAO
    func getActivityDAO() -> ActivityDAO
    func getSpecialityDAO() -> SpecialityDAO
    
}
