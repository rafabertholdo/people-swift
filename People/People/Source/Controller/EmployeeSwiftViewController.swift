//
//  EmployeeSwiftViewController.swift
//  People
//
//  Created by Rafael Guilherme Bertholdo on 28/02/18.
//  Copyright © 2018 CI&T. All rights reserved.
//

import Foundation

class EmployeeSwiftViewController: UIViewController, ViewCustomizable {
    typealias MainView = EmployeeView
    var login: String?
    
    lazy var manager = EmployeeManager()
    var viewModel: EmployeeViewModel? {
        didSet {
            if let viewModel = viewModel {
                mainView.setModel(model: viewModel)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = []
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        load()
    }
    
    private func load() {
        guard let login = self.login else { return }
        mainView.setLoadingScreen(view: mainView, navigationController: navigationController)
        manager.getEmployee(user: login) { [weak self](employee, error) in
            guard let weakSelf = self else { return }
            if let e = error {
                print(e.localizedDescription)
                return
            }
            
            guard let employee = employee else {
                return
            }
            weakSelf.viewModel = EmployeeViewModel(employee: employee, imgRequest: weakSelf.manager.requestForEmployeeImage(login: login))
            weakSelf.mainView.removeLoadingScreen()
        }
        
    }
}
