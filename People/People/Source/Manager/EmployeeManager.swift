//
//  EmployeeManager.swift
//  People
//
//  Created by Bruno Medeiros Rafael on 03/01/2018.
//  Copyright © 2018 CI&T. All rights reserved.
//

import UIKit

typealias EmployeesUICallback = (@escaping () throws -> [Employee]) -> Void
typealias EmployeeUICallback = (@escaping () throws -> Employee) -> Void

@objcMembers
class EmployeeManager: BaseManager {
    
    lazy var business = EmployeeBusiness()
    
    func searchEmployees(_ searchString: String, completion: @escaping EmployeesUICallback) {
        operations.addOperation {
            self.business.searchEmployees(searchString, completion: { (result) in
                OperationQueue.main.addOperation {
                    completion(result)
                }
            })
        }
    }
    
    func getEmployee(user: String, completion: @escaping (Employee?, NSError?) -> Void) {
        operations.addOperation {
            self.business.getEmployee(user: user, completion: { (result) in
                OperationQueue.main.addOperation {
                    do {
                        let employee = try result()
                        completion(employee, nil)
                    } catch {
                        completion(nil, NSError(domain: "", code: 666, userInfo: [NSLocalizedDescriptionKey: error.localizedDescription]))
                    }
                    
                }
            })
        }
    }
    
    func requestForEmployeeImage(login: String) -> URLRequest? {
        return business.requestForEmployeeImage(login: login)
    }
}
