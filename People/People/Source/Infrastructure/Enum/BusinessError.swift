//
//  BusinessError.swift
//  People
//
//  Created by Bruno Medeiros Rafael on 27/12/2017.
//  Copyright © 2017 CI&T. All rights reserved.
//

enum BusinessError: Error {
    case invalidToken
    case parse(key:String)
    case invalidLogin
    case expiredLogin
}
