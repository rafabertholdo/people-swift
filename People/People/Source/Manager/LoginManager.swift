//
//  LoginManager.swift
//  People
//
//  Created by Bruno Medeiros Rafael on 27/12/2017.
//  Copyright © 2017 CI&T. All rights reserved.
//

import Foundation

typealias LoginUICallback = (@escaping () throws -> Bool) -> Void
typealias TokenUICallback = (@escaping () -> Bool) -> Void

class LoginManager: BaseManager {
    
    lazy var business = LoginBusiness()
    
    func hasToken(_ completion: @escaping TokenUICallback) {
        operations.addOperation {
            self.business.hasToken({ (result) in
                OperationQueue.main.addOperation {
                    completion(result)
                }
            })
        }
    }
    
    func login(user: String, password: String, completion: @escaping LoginUICallback) {
        operations.addOperation {
            self.business.login(user: user, password: password, completion: { (result) in
                OperationQueue.main.addOperation {
                    completion(result)
                }
            })
        }
    }
}
