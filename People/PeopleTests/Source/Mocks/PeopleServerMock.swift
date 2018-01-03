//
//  PeopleServerMock.swift
//  PeopleTests
//
//  Created by Bruno Medeiros Rafael on 03/01/2018.
//  Copyright © 2018 CI&T. All rights reserved.
//

import Foundation
@testable import People

class PeopleServerMock: PeopleServerProtocol {
    
    func employeeWithLogin(login: String, token: String, completion: @escaping EmployeeCallback) {
        do {
            let jsonDictionary: [String: AnyObject] = try readFile(login)
            completion { jsonDictionary }
        } catch {
            completion { throw error }
        }
    }
    
    func searchEmployees(search: String, token: String, completion: @escaping SearchCallback) {
        do {
            let jsonDictionary: [String: AnyObject] = try readFile(search)
            completion { jsonDictionary }
        } catch {
            completion { throw error }
        }
    }
    
    func requestForEmployeeImage(login: String, token: String) -> URLRequest? {
        return nil
    }
    
    private func readFile<T>(_ fileName: String ) throws -> T {
        do {
            let bundle = Bundle(for: type(of: self))
            guard let pathString = bundle.path(forResource: fileName, ofType: "json") else {
                throw TecnicalError.invalidResponse
            }
            
            guard let jsonString = try? String(contentsOfFile: pathString, encoding: String.Encoding.utf8) else {
                throw TecnicalError.invalidResponse
            }
            
            guard let jsonData = jsonString.data(using: String.Encoding.utf8) else {
                throw TecnicalError.invalidResponse
            }
            
            guard let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? T else {
                 throw TecnicalError.serialization
            }
            
            return json
        } catch {
            throw TecnicalError.invalidResponse
        }
    }
}
