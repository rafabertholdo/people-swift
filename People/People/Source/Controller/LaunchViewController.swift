//
//  LaunchViewController.swift
//  People
//
//  Created by Bruno Medeiros Rafael on 03/01/2018.
//  Copyright © 2018 CI&T. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {

    lazy var manager = LoginManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        manager.hasToken {[weak self] (hasToken) in
            guard let weakSelf = self else { return }
            guard hasToken() else {
                weakSelf.performSegue(withIdentifier: LoginViewController.identifier, sender: nil)
                return
            }
            weakSelf.performSegue(withIdentifier: SearchViewController.identifier, sender: nil)
        }
    }
}
