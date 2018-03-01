//
//  DataExtension.swift
//  People
//
//  Created by Rafael Guilherme Bertholdo on 28/02/18.
//  Copyright © 2018 CI&T. All rights reserved.
//

import Foundation

extension Data {
    func toDictionary() throws -> NSDictionary {
        guard let searchDictionary = try JSONSerialization.jsonObject(with: self, options: .mutableLeaves) as? NSDictionary else {
            throw TecnicalError.requestError
        }
        return searchDictionary
    }
}
