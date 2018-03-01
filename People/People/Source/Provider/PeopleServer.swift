//
//  PeopleServer.swift
//  People
//
//  Created by SalmoJunior on 26/12/17.
//  Copyright © 2017 CI&T. All rights reserved.
//

import Foundation

typealias NetworkResponse = (statusCode: Int, data: Data)
typealias NetworkCallback = (() throws -> NetworkResponse?) -> Void

struct PeopleServer: PeopleServerProtocol {
    // MARK: - Constants
    private let baseURL = "https://people.cit.com.br"
    private let authorizationKey = "Authorization"
    private let authorizationValue = "Basic"
    
    // Public Methods
    func employeeWithLogin(login: String, token: String, completion: @escaping NetworkCallback) {
        guard let url = URL(string: "\(baseURL)/profile/\(login)?format=json") else {
            completion { throw TecnicalError.invalidURL }
            
            return
        }
        
        let session = URLSession.shared
        let request = authenticatedRequest(url: url, token: token)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            self.handleResponse(data: data, response: response, error: error, completion: completion)
        }
        
        task.resume()
    }
    
    func handleResponse(data: Data?, response: URLResponse?, error: Error?, completion: @escaping NetworkCallback) {
        guard error == nil else {
            completion { throw TecnicalError.requestError }
            
            return
        }
        guard let httpResponse = response as? HTTPURLResponse else {
            completion { throw TecnicalError.requestError }
            
            return
        }
        guard let responseData = data else {
            completion { throw TecnicalError.requestError }
            
            return
        }
        
        switch httpResponse.statusCode {
        case 200...299:
            completion { (httpResponse.statusCode, responseData) }
        case 401:
            completion { throw TecnicalError.authenticationFailed }
        default:
            completion { throw TecnicalError.requestError }
        }
    }
    
    func searchEmployees(search: String, token: String, completion: @escaping NetworkCallback) {
        guard let url = URL(string: "\(baseURL)/search/json/?format=associative&q=\(search)") else {
            completion { throw TecnicalError.invalidURL }
            
            return
        }
        
        let session = URLSession.shared
        let request = authenticatedRequest(url: url, token: token)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            self.handleResponse(data: data, response: response, error: error, completion: completion)
        }
        
        task.resume()
    }
    
    func requestForEmployeeImage(login: String, token: String) -> URLRequest? {
        guard let url = URL(string: "\(baseURL)/photos/\(login).jpg") else {
            return nil
        }
        
        let request = authenticatedRequest(url: url, token: token)
    
        return request
    }
    
    // MARK: - Private Methods
    
    private func authenticatedRequest(url: URL, token: String) -> URLRequest {
        var request = URLRequest(url: url)
        let value = "\(authorizationValue) \(token)"
        
        request.addValue(value, forHTTPHeaderField: authorizationKey)
        
        return request
    }
}
