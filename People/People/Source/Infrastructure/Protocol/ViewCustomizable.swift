//
//  ViewCustomizable.swift
//  People
//
//  Created by Bruno Medeiros Rafael on 27/12/2017.
//  Copyright © 2017 CI&T. All rights reserved.
//

import UIKit

protocol ViewCustomizable: class {
    associatedtype MainView
}

extension ViewCustomizable where Self: UIViewController {
    var mainView: MainView {
        guard let mainView = self.view as? MainView else {
            fatalError()
        }
        
        return mainView
    }
}
