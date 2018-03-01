//
//  EmployeeView.swift
//  People
//
//  Created by Bruno Medeiros Rafael on 10/01/2018.
//  Copyright © 2018 CI&T. All rights reserved.
//

import UIKit

class EmployeeView: UIView, ViewSpinnable {
    var loadingView = UIView()
    var spinner = UIActivityIndicatorView()
    var loadingLabel = UILabel()
    
    @IBOutlet weak var employeePhoto: UIImageView!    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var role: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var coach: UILabel!
    @IBOutlet weak var contact1: UILabel!
    @IBOutlet weak var contact2: UILabel!
    @IBOutlet weak var contact3: UILabel!
    
    func setModel(model: EmployeeViewModel) {
        name.text = model.name
        role.text = model.role
        if let email = model.email {
            self.email.text = email
        }
        location.text = model.location
        coach.text = model.coach
        contact1.text = model.contacts?[0]
        contact2.text = model.contacts?[1]
        contact3.text = model.contacts?[2]
        
        employeePhoto.af_setImage(withURLRequest: model.imgRequest)
    }
}
