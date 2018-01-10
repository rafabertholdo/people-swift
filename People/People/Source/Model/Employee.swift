//
//  Employee.swift
//  People
//
//  Created by Bruno Medeiros Rafael on 03/01/2018.
//  Copyright © 2018 CI&T. All rights reserved.
//

import Foundation

@objcMembers
class Employee: NSObject, Codable {
    let building: String?
    let email: String?
    let location: String?
    let login: String
    let managerLogin: String?
    let mentor: String?
    let mentorLogin: String?
    let name: String?
    let contact1: String?
    let type1: String?
    let contact2: String?
    let type2: String?
    let contact3: String?
    let type3: String?
    let role: String?
    let ownWords: String?
    let position: String?
    
    private enum CodingKeys: String, CodingKey {
        case building
        case email
        case location
        case login
        case managerLogin = "manager_login"
        case mentor
        case mentorLogin = "mentor_login"
        case name
        case contact1
        case type1
        case contact2
        case type2
        case contact3
        case type3
        case role
        case ownWords = "own_words"
        case position
    }
    
    init(building: String?, email: String?, location: String?, login: String, managerLogin: String?, mentor: String?, mentorLogin: String?, name: String?, contact1: String?, type1: String?, contact2: String?, type2: String?, contact3: String?, type3: String?, role: String?, ownWords: String?, position: String?) {
        self.building = building
        self.email = email
        self.location = location
        self.login = login
        self.managerLogin = managerLogin
        self.mentor = mentor
        self.mentorLogin = mentorLogin
        self.name = name
        self.contact1 = contact1
        self.type1 = type1
        self.contact2 = contact2
        self.type2 = type2
        self.contact3 = contact3
        self.type3 = type3
        self.role = role
        self.ownWords = ownWords
        self.position = position
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        guard let object = object as? Employee else {
            return false
        }
        return self.building == object.building
            && self.email == object.email
            && self.location == object.location
            && self.login == object.login
            && self.managerLogin == object.managerLogin
            && self.mentor == object.mentor
            && self.mentorLogin == object.mentorLogin
            && self.name == object.name
            && self.contact1 == object.contact1
            && self.contact2 == object.contact2
            && self.contact3 == object.contact3
            && self.type1 == object.type1
            && self.type2 == object.type2
            && self.type3 == object.type3
            && self.role == object.role
            && self.ownWords == object.ownWords
            && self.position == object.position
    }
}

/*func == (self: Employee, object: Employee) -> Bool {
    return self.building == object.building
        && self.email == object.email
        && self.location == object.location
        && self.login == object.login
        && self.manager_login == object.manager_login
        && self.mentor == object.mentor
        && self.mentor_login == object.mentor_login
        && self.name == object.name
        && self.contact1 == object.contact1
        && self.contact2 == object.contact2
        && self.contact3 == object.contact3
        && self.type1 == object.type1
        && self.type2 == object.type2
        && self.type3 == object.type3
        && self.role == object.role
        && self.own_words == object.own_words
        && self.position == object.position
}*/
