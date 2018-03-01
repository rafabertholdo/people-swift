//
//  EmployeeViewModel.swift
//  People
//
//  Created by Rafael Guilherme Bertholdo on 28/02/18.
//  Copyright © 2018 CI&T. All rights reserved.
//

import Foundation

struct EmployeeViewModel {
    let imgRequest: URLRequest
    let name: String?
    let role: String?
    let ownWords: String?
    let email: String?
    let location: String?
    let coach: String?
    let contacts: [String?]?
    
    init?(employee: Employee, imgRequest: URLRequest?) {
        guard let imgRequest = imgRequest else {
            return nil
        }
        
        self.name = employee.name
        self.email = employee.email
        if let location = employee.location {
            self.location = location + (employee.building != nil ? " - \(employee.building!)" : "")
        } else {
            self.location = nil
        }
        self.ownWords = employee.ownWords
        self.coach = employee.mentor
        self.contacts = [employee.contact1,
                         employee.contact2,
                         employee.contact3]
        self.role = employee.role
        self.imgRequest = imgRequest
    }
}
