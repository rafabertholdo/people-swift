//
//  LoginManager.swift
//  People
//
//  Created by Bruno Medeiros Rafael on 27/12/2017.
//  Copyright © 2017 CI&T. All rights reserved.
//

import Foundation

typealias LoginUICallback = (@escaping () throws -> Bool) -> Void

class LoginManager: BaseManager {
    
    lazy var business = LoginBusiness()
    func login(user: String, password: String, completion: @escaping LoginUICallback) {
        operations.addOperation {
            self.business.login(user: user, password: password, completion: completion)
        }
    }
}
