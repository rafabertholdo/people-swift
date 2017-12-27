//
//  StringExtension.swift
//  People
//
//  Created by Bruno Medeiros Rafael on 27/12/2017.
//  Copyright © 2017 CI&T. All rights reserved.
//

import Foundation

extension String {
    
    func toBase64() -> String? {
        guard let data = self.data(using: String.Encoding.utf8) else { return nil }
        let base64 = data.base64EncodedString()
        return base64
    }
}
