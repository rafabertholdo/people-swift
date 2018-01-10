//
//  ControlFlowStoryboardSegue.swift
//  People
//
//  Created by Bruno Medeiros Rafael on 10/01/2018.
//  Copyright © 2018 CI&T. All rights reserved.
//

import UIKit

class ControlFlowStoryboardSegue: UIStoryboardSegue {
    
    override func perform() {
        guard let identifier = identifier else { return }
        
        switch identifier {
        case Constants.ViewControllers.employee:
            showEmployeeDetails()
        default:
            fatalError()
        }
    }
    
    private func showEmployeeDetails() {
        guard let searchViewController = source as? SearchViewController else { return }
        guard let employeeViewController = destination as? EmployeeViewController else { return }
        guard let login = searchViewController.selectedLogin else { return }
        employeeViewController.load(withLogin: login)
        searchViewController.navigationController?.pushViewController(employeeViewController, animated: true)
    }
}
