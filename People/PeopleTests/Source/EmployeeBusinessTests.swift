//
//  EmployeeBusinessTests.swift
//  PeopleTests
//
//  Created by Bruno Medeiros Rafael on 03/01/2018.
//  Copyright © 2018 CI&T. All rights reserved.
//

import XCTest
@testable import People

class EmployeeBusinessTests: XCTestCase {
    
    var business = EmployeeBusiness()
    
    override func setUp() {
        super.setUp()
        business.provider = PeopleServerMock()
    }
    
    func testSearchSuccess() {
        business.searchEmployees("bruno") { (result) in
            do {
                let employees = try result()
                XCTAssertEqual(employees.count, 45, "quantidade errada")
            } catch {
                XCTFail("Busca inválida")
            }
        }
    }
    
    func testSearchEmployee() {
        let localEmployee = Employee(building: nil, email: "brafael@ciandt.com", location: "BH", login: "validUser", manager_login: "marciare", mentor: "Claudia Yuri Katagi", mentor_login: "ckatagi", name: "Bruno Medeiros Rafael", contact1: "+55 2677", type1: "C", contact2: "+55 0 32 9145 8192", type2: "M", contact3: nil, type3: nil, role: "Developer", own_words: nil, position: nil)
        
        business.getEmployee(user: "validUser") { (result) in
            do {
                let remoteEmployee = try result()
                XCTAssertTrue(localEmployee == remoteEmployee, "Usuários diferentes")
            } catch {
                XCTFail("usuário não encontrado")
            }
        }
        
        
    }
    
}
