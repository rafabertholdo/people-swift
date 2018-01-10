//
//  EmployeeCellViewModel.swift
//  People
//
//  Created by Bruno Medeiros Rafael on 10/01/2018.
//  Copyright © 2018 CI&T. All rights reserved.
//

import Foundation

struct EmployeeCellViewModel {
    let imgRequest:URLRequest
    let name:NSAttributedString
    let login:NSAttributedString
    
    init?(employee:Employee, imgRequest:URLRequest?) {
        guard let name = employee.name else {
            return nil
        }
        guard let imgRequest = imgRequest else {
            return nil
        }
        
        self.name = NSAttributedString(string:name)
        self.login = NSAttributedString(string:employee.login)
        self.imgRequest = imgRequest
    }
    
}
