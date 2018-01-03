//
//  LoginBusiness.swift
//  People
//
//  Created by Bruno Medeiros Rafael on 27/12/2017.
//  Copyright © 2017 CI&T. All rights reserved.
//

import Foundation
import KeychainAccess

struct LoginBusiness {

    var provider: PeopleServerProtocol = PeopleServer()
    
    func hasToken(_ completion: @escaping TokenUICallback) {
        let keychain = Keychain(service: Constants.keyService)
        let hasToken = keychain[Constants.tokenService] != nil ? true : false
        completion { hasToken }
    }
    
    func login(user: String, password: String, completion: @escaping LoginUICallback) {
        guard let token = "\(user):\(password)".toBase64() else {
            completion {
                throw BusinessError.invalidToken
            }
            return
        }
        provider.employeeWithLogin(login: user, token: token) { (result) in
            do {
                guard let userDictionary = try result() else {
                    completion { throw TecnicalError.requestError }
                    return
                }
                guard let personalInfoDictionary = userDictionary[Constants.keyPersonalInfo] as? [String: AnyObject] else {
                    completion { throw BusinessError.parse(key: Constants.keyPersonalInfo) }
                    return
                }
                
                let jsonData = try JSONSerialization.data(withJSONObject: personalInfoDictionary, options: .prettyPrinted)
                let decoder = JSONDecoder()
                let employee: Employee = try decoder.decode(Employee.self, from: jsonData)
                
                guard user == employee.login else {
                    completion { throw BusinessError.invalidLogin }
                    return
                }
                
                //adicionar no keychain
                let keychain = Keychain(service: Constants.keyService)
                keychain[Constants.tokenService] = token
            
                completion { true }
                
            } catch let error where error is TecnicalError {
                completion { throw error }
            } catch {
                completion { throw TecnicalError.serialization }
            }
        }
    }
}
