//
//  LoginView.swift
//  People
//
//  Created by Bruno Medeiros Rafael on 27/12/2017.
//  Copyright © 2017 CI&T. All rights reserved.
//

import UIKit

class LoginView: UIView {

    @IBOutlet weak private var userNameTextField: UITextField!
    @IBOutlet weak private var passwordTextField: UITextField!
    
    weak var delegate: LoginViewDelegate?
    
    @IBAction func didTouchLoginButton(_ sender: UIButton) {
        guard let userNameText = userNameTextField.text, !userNameText.isEmpty else {
            print("usuário não informado.")
            return
        }
        guard let passwordText = passwordTextField.text, !passwordText.isEmpty else {
            print("Senha não informada.")
            return
        }
        
        delegate?.didTouchLogin(login: userNameText, password: passwordText)
    }

}
