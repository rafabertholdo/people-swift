//
//  EmployeeBusiness.swift
//  People
//
//  Created by Bruno Medeiros Rafael on 03/01/2018.
//  Copyright © 2018 CI&T. All rights reserved.
//

import Foundation
import KeychainAccess

struct EmployeeBusiness {
    var provider: PeopleServerProtocol = PeopleServer()
    let kJsonKey = "data"
    
    func searchEmployees(_ searchString: String, completion: @escaping EmployeesUICallback) {
        
        guard let token = getToken() else {
            completion { throw BusinessError.expiredLogin }
            return
        }
        
        provider.searchEmployees(search: searchString, token: token) { (result) in
            do {
                guard let searchDictionary = try result() else {
                    completion { throw TecnicalError.invalidResponse }
                    return
                }
                
                guard let employeesArray = searchDictionary[self.kJsonKey] as? [AnyObject] else {
                    completion { throw BusinessError.parse(key: self.kJsonKey)}
                    return
                }
                // parecido com um for - https://medium.com/@abhimuralidharan/higher-order-functions-in-swift-filter-map-reduce-flatmap-1837646a63e8
                let employees = try employeesArray.map({ (element) -> Employee in
                    let jsonData = try JSONSerialization.data(withJSONObject: element, options: .prettyPrinted)
                    let decoder = JSONDecoder()
                    let employee: Employee = try decoder.decode(Employee.self, from: jsonData)
                    return employee
                })
                completion { employees }
            } catch TecnicalError.authenticationFailed {
                let keychain = Keychain(service: Constants.keyService)
                keychain[Constants.tokenService] = nil
                completion { throw BusinessError.expiredLogin }
            } catch {
                completion { throw error }
            }
        }
    }
    
    func getEmployee(user: String, completion: @escaping EmployeeUICallback) {
        
        guard let token = getToken() else {
            completion { throw BusinessError.expiredLogin }
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
                
                completion { employee }
                
            } catch let error where error is TecnicalError {
                completion { throw error }
            } catch {
                completion { throw TecnicalError.serialization }
            }
        }
    }
    
    func requestForEmployeeImage(login: String) -> URLRequest? {
        guard let token = getToken() else {
            return nil
        }
        let request = provider.requestForEmployeeImage(login: login, token: token)
        return request
    }
    
    private func getToken() -> String? {
        let keychain = Keychain(service: Constants.keyService)
        let token = keychain[Constants.tokenService]
        return token
    }
    
}
