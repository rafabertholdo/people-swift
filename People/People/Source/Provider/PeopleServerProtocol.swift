//
//  PeopleServerProtocol.swift
//  People
//
//  Created by Bruno Medeiros Rafael on 03/01/2018.
//  Copyright © 2018 CI&T. All rights reserved.
//

import Foundation

protocol PeopleServerProtocol {
    func employeeWithLogin(login: String, token: String, completion: @escaping NetworkCallback)
    func searchEmployees(search: String, token: String, completion: @escaping NetworkCallback)
    func requestForEmployeeImage(login: String, token: String) -> URLRequest?
}
