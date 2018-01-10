//
//  EmployeeTableViewCell.swift
//  People
//
//  Created by Bruno Medeiros Rafael on 03/01/2018.
//  Copyright © 2018 CI&T. All rights reserved.
//

import UIKit
//import Kingfisher
import AlamofireImage

class EmployeeTableViewCell: UITableViewCell, ViewIdentifiable {
    @IBOutlet private weak var employeeImage: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var loginLabel: UILabel!
    
    func setModel(model: EmployeeCellViewModel) {
        nameLabel.attributedText = model.name
        loginLabel.attributedText = model.login
        
        employeeImage.af_setImage(withURLRequest: model.imgRequest)
        
        //imagem com o kingfisher
//        let modifier = AnyModifier { request in
//            var r = request
//            r.setValue(model.imgRequest.allHTTPHeaderFields?["Authorization"], forHTTPHeaderField: "Authorization")
//            return r
//        }
//        employeeImage.kf.setImage(with: model.imgRequest.url, placeholder: nil, options: [.requestModifier(modifier)])
        
    }
}
