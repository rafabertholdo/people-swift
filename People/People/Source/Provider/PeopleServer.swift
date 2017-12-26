//
//  PeopleServer.swift
//  People
//
//  Created by SalmoJunior on 26/12/17.
//  Copyright © 2017 CI&T. All rights reserved.
//

import Foundation

typealias EmployeeCallback = (() throws -> [String: AnyObject]?) -> Void
typealias SearchCallback = (() throws -> [AnyObject]?) -> Void

struct PeopleServer {
    // MARK: - Constants
    private static let baseURL = "https://people.cit.com.br"
    private static let authorizationKey = "Authorization"
    private static let authorizationValue = "Basic"
    
    // Public Methods
    static func employeeWithLogin(login: String, token: String, completion: @escaping EmployeeCallback) {
        guard let url = URL(string: "\(baseURL)/profile/\(login)?format=json") else {
            completion { throw TecnicalError.invalidURL }
            
            return
        }
        
        let session = URLSession.shared
        let request = PeopleServer.authenticatedRequest(url: url, token: token)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            do {
                guard error == nil else {
                    completion { throw TecnicalError.requestError }
                    
                    return
                }
                guard let httpResponse = response as? HTTPURLResponse else {
                    completion { throw TecnicalError.requestError }
                    
                    return
                }
                guard let dataResponse = data else {
                    completion { throw TecnicalError.requestError }
                    
                    return
                }
                
                switch httpResponse.statusCode {
                case 200...299:
                    guard let json = try JSONSerialization.jsonObject(with: dataResponse, options: .mutableLeaves) as? NSDictionary else {
                        completion { throw TecnicalError.requestError }
                        
                        return
                    }
                    
                    completion { json as? [String: AnyObject] }
                default:
                    completion { throw TecnicalError.requestError }
                }
            } catch {
                completion { throw TecnicalError.requestError }
            }
        }
        
        task.resume()
    }
    
    static func searchEmployees(search: String, token: String, completion: @escaping SearchCallback) {
        guard let url = URL(string: "\(baseURL)/search/json/?format=associative&q=\(search)") else {
            completion { throw TecnicalError.invalidURL }
            
            return
        }
        
        let session = URLSession.shared
        let request = PeopleServer.authenticatedRequest(url: url, token: token)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            do {
                guard error == nil else {
                    completion { throw TecnicalError.requestError }
                    
                    return
                }
                guard let httpResponse = response as? HTTPURLResponse else {
                    completion { throw TecnicalError.requestError }
                    
                    return
                }
                guard let dataResponse = data else {
                    completion { throw TecnicalError.requestError }
                    
                    return
                }
                
                switch httpResponse.statusCode {
                case 200...299:
                    guard let json = try JSONSerialization.jsonObject(with: dataResponse, options: .mutableLeaves) as? NSArray else {
                        completion { throw TecnicalError.requestError }
                        
                        return
                    }
                    
                    completion { json as [AnyObject] }
                default:
                    completion { throw TecnicalError.requestError }
                }
            } catch {
                completion { throw TecnicalError.requestError }
            }
        }
        
        task.resume()
    }
    
    static func requestForEmployeeImage(login: String, token: String) -> URLRequest? {
        guard let url = URL(string: "\(baseURL)/photos/\(login).jpg") else {
            return nil
        }
        
        let request = PeopleServer.authenticatedRequest(url: url, token: token)
    
        return request
    }
    
    // MARK: - Private Methods
    
    private static func authenticatedRequest(url: URL, token: String) -> URLRequest {
        var request = URLRequest(url: url)
        let value = "\(authorizationValue) \(token)"
        
        request.addValue(value, forHTTPHeaderField: authorizationKey)
        
        return request
    }
}
