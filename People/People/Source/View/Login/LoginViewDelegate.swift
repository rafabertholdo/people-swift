//
//  LoginViewDelegate.swift
//  People
//
//  Created by Bruno Medeiros Rafael on 27/12/2017.
//  Copyright © 2017 CI&T. All rights reserved.
//

protocol LoginViewDelegate: class {
    func didTouchLogin(login: String, password: String)
}
