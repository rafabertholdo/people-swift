//
//  SearchView.swift
//  People
//
//  Created by Bruno Medeiros Rafael on 03/01/2018.
//  Copyright © 2018 CI&T. All rights reserved.
//

import UIKit

class SearchView: UIView {
    @IBOutlet private weak var searchTextField: UITextField!
    @IBOutlet private weak var employeeTableView: UITableView!
    
    weak var delegate: SearchViewDelegate?
    var employees = [EmployeeCellViewModel!]() {
        didSet {
            employeeTableView.reloadData()
        }
    }

    @IBAction func search(_ sender: Any) {
        guard let searchString = searchTextField.text else { return }
        delegate?.didSearch(string: searchString)
    }
}

extension SearchView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeTableViewCell.identifier) as? EmployeeTableViewCell else {
            fatalError("célula não encontrada")
        }
        cell.setModel(model: employees[indexPath.row])
        return cell
    }    
}
