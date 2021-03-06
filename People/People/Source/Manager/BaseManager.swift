//
//  BaseManager.swift
//  People
//
//  Created by Bruno Medeiros Rafael on 27/12/2017.
//  Copyright © 2017 CI&T. All rights reserved.
//

import Foundation

open class BaseManager: NSObject {
    
    //MARK: Properties
    var operations: OperationQueue
    
    //MARK: Initializers
    
    /**
     Initialize an BaseManager subclass.
     
     - returns: an instance of BaseManager subclass.
     */
    override init() {
        operations = OperationQueue()
    }
    
    /**
     Initialize an BaseManager subclass.
     
     - parameter maxConcurrentOperationCount: maximun number of concurrent operations.
     
     - returns: an instance of BaseManager subclass.
     */
    convenience init(maxConcurrentOperationCount: Int) {
        self.init()
        
        operations.maxConcurrentOperationCount = maxConcurrentOperationCount
    }
    
    //MARK: Deinitalizers
    
    deinit {
        operations.cancelAllOperations()
    }
}
