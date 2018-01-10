//
//  EmployeeTableViewCell.swift
//  People
//
//  Created by Bruno Medeiros Rafael on 03/01/2018.
//  Copyright © 2018 CI&T. All rights reserved.
//

import UIKit
import Kingfisher
//import Alamofire

class EmployeeTableViewCell: UITableViewCell, ViewIdentifiable {
    @IBOutlet private weak var employeeImage: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var loginLabel: UILabel!
    
    func setModel(model: EmployeeCellViewModel) {
        nameLabel.attributedText = model.name
        loginLabel.attributedText = model.login
        /*
        let modifier = AnyModifier { requests in
            var r = request
            r.setva
        }
        employeeImage.kf.setImage(with: <#T##Resource?#>)
        
        employeeImage.kf.setImage(with: <#T##Resource?#>, placeholder: <#T##Placeholder?#>, options: [.requestModifier(ImageDownloadRequestModifier) .modified(<#T##ImageDownloadRequestModifier#>)]KingfisherOptionsInfo?, progressBlock: <#T##DownloadProgressBlock?##DownloadProgressBlock?##(Int64, Int64) -> ()#>, completionHandler: <#T##CompletionHandler?##CompletionHandler?##(Image?, NSError?, CacheType, URL?) -> ()#>).downloadTask?.ownerDownloader?.authenticationChallengeResponder
*/
    }
}
