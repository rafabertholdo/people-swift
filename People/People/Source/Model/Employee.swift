//
//  Employee.swift
//  People
//
//  Created by Bruno Medeiros Rafael on 03/01/2018.
//  Copyright © 2018 CI&T. All rights reserved.
//

import Foundation

struct Employee: Codable {
    //let birthday: Date?
    let building: String?
    let email: String?
    let location: String?
    let login: String
    let manager_login: String?
    let mentor: String?
    let mentor_login: String?
    let name: String?
    let contact1: String?
    let type1: String?
    let contact2: String?
    let type2: String?
    let contact3: String?
    let type3: String?
    let role: String?
    let own_words: String?
    let position: String?
}

extension Employee: Equatable {
    static func == (lhs: Employee, rhs: Employee) -> Bool {
        return lhs.building == rhs.building
            && lhs.email == rhs.email
            && lhs.location == rhs.location
            && lhs.login == rhs.login
            && lhs.manager_login == rhs.manager_login
            && lhs.mentor == rhs.mentor
            && lhs.mentor_login == rhs.mentor_login
            && lhs.name == rhs.name
            && lhs.contact1 == rhs.contact1
            && lhs.contact2 == rhs.contact2
            && lhs.contact3 == rhs.contact3
            && lhs.type1 == rhs.type1
            && lhs.type2 == rhs.type2
            && lhs.type3 == rhs.type3
            && lhs.role == rhs.role
            && lhs.own_words == rhs.own_words
            && lhs.position == rhs.position
    }
}
