//
//  LoginViewController.swift
//  People
//
//  Created by Bruno Medeiros Rafael on 27/12/2017.
//  Copyright © 2017 CI&T. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, ViewCustomizable, ViewIdentifiable {
    typealias MainView = LoginView
    let manager = LoginManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.delegate = self
    }
}
extension LoginViewController: LoginViewDelegate {
    func didTouchLogin(login: String, password: String) {
        manager.login(user: login, password: password) { [unowned self](result) in
            do {
                let success = try result()
                if success {
                    self.performSegue(withIdentifier: SearchViewController.identifier, sender: nil)
                    print("passou")
                } else {
                    print("else")
                }
            } catch {
                print("ERROR")
            }
        }
        
    }
}
