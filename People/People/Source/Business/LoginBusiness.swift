//
//  LoginBusiness.swift
//  People
//
//  Created by Bruno Medeiros Rafael on 27/12/2017.
//  Copyright © 2017 CI&T. All rights reserved.
//

import Foundation

struct LoginBusiness {

    func login(user: String, password: String, completion: @escaping LoginUICallback) {
        guard let token = "\(user):\(password)".toBase64() else {
            completion {
                throw BusinessError.invalidToken
            }
            return }
//        PeopleServer.employeeWithLogin(login: user, token: token) { (<#() throws -> [String : AnyObject]?#>) in
//            <#code#>
//        }
        print(token)
    }
}


