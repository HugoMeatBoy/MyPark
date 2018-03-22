//
//  DAO.swift
//  P(z)K
//
//  Created by Thais Aurard on 20/03/2018.
//  Copyright © 2018 Thais AURARD. All rights reserved.
//

import Foundation

protocol DAO {
    associatedtype Object
    
    func create() throws -> Object
    func delete(obj: Object)
    func getAll() throws -> [Object?]
}

