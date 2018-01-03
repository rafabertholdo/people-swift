//
//  TecnicalError.swift
//  People
//
//  Created by SalmoJunior on 26/12/17.
//  Copyright © 2017 CI&T. All rights reserved.
//

import Foundation

enum TecnicalError: Error {
    case invalidURL
    case requestError
    case serialization
    case invalidResponse
}
