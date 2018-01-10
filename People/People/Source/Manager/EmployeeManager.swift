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
    
    func getEmployee(user: String, completion: @escaping EmployeeUICallback) {
        operations.addOperation {
            self.business.getEmployee(user: user, completion: { (result) in
                OperationQueue.main.addOperation {
                    completion(result)
                }
            })
        }
    }
    
    func requestForEmployeeImage(login: String) -> URLRequest? {
        return business.requestForEmployeeImage(login: login)
    }
}
