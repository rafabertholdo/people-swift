//
//  LoginBusinessTests.swift
//  PeopleTests
//
//  Created by Bruno Medeiros Rafael on 03/01/2018.
//  Copyright © 2018 CI&T. All rights reserved.
//

import XCTest
@testable import People

class LoginBusinessTests: XCTestCase {
    
    var business = LoginBusiness()
    
    override func setUp() {
        super.setUp()
        business.provider = PeopleServerMock()
    }
    
    func testLoginSuccess() {
        business.login(user: "validUser", password: "") { (result) in
            do {
                let sucess = try result()
                XCTAssertTrue(sucess, "Login invalido")
            } catch {
                XCTFail("falha no login")
            }
        }
    }
    
    func testLoginFail() {
        business.login(user: "invalidUser", password: "") { (result) in
            do {
                _ = try result()
                XCTFail("falha no login")
            } catch BusinessError.invalidLogin {
                XCTAssertTrue(true)
            } catch {
                XCTFail("falha no login")
            }
        }
    }
    
    func testLoginFormatedJsonInvalid() {
        business.login(user: "invalidJson", password: "") { (result) in
            do {
                _ = try result()
                XCTFail("falha no login")
            } catch TecnicalError.invalidResponse {
                XCTAssertTrue(true)
            } catch {
                XCTFail("falha no login")
            }
        }
    }
}
