//
//  SearchViewController.swift
//  People
//
//  Created by Bruno Medeiros Rafael on 03/01/2018.
//  Copyright © 2018 CI&T. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, ViewIdentifiable, ViewCustomizable {
    typealias MainView = SearchView
    lazy var manager = EmployeeManager()
    private(set) var selectedLogin: String? 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.delegate = self
    }
}

extension SearchViewController: SearchViewDelegate {
    func didSearch(string: String) {
        mainView.employees = []
        mainView.setLoadingScreen(view: mainView, navigationController: navigationController)
        manager.searchEmployees(string) { [weak self] (result) in
            guard let weakSelf = self else { return }
            do {
                let employees = try result()
                let employeeViewModels = employees.map({ (employee) -> EmployeeCellViewModel? in
                    let imgRequest = weakSelf.manager.requestForEmployeeImage(login: employee.login)
                    return EmployeeCellViewModel(employee: employee, imgRequest: imgRequest)
                }).filter({ (employee) -> Bool in
                    return employee != nil
                })
                
                weakSelf.mainView.employees = employeeViewModels
            } catch BusinessError.expiredLogin {
                weakSelf.dismiss(animated: true, completion: nil)
            } catch {
                //todo - exibir o erro na tela
                print(error.localizedDescription)
            }
            weakSelf.mainView.removeLoadingScreen()
        }
    }
    
    func didSelectEmployee(login: String) {
        selectedLogin = login
        performSegue(withIdentifier: Constants.ViewControllers.employee, sender: nil)
    }
}
