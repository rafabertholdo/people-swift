//
//  ViewIdentifiable.swift
//  People
//
//  Created by Bruno Medeiros Rafael on 03/01/2018.
//  Copyright © 2018 CI&T. All rights reserved.
//

import UIKit

protocol ViewIdentifiable: class { }

//toda view controller vai ter a propriedade idenfitier que vai retornar o nome da controller como string.
extension ViewIdentifiable where Self: UIViewController {
    static var identifier: String {
        return String(describing: self)
    }
}

extension ViewIdentifiable where Self: UIView {
    static var identifier: String {
        return String(describing: self)
    }
}
