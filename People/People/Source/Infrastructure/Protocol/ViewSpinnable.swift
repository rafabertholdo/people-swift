//
//  ViewSpinnable.swift
//  People
//
//  Created by Rafael Guilherme Bertholdo on 01/03/18.
//  Copyright © 2018 CI&T. All rights reserved.
//

import UIKit

protocol ViewSpinnable {
    var loadingView: UIView { get }
    var spinner: UIActivityIndicatorView { get }
    var loadingLabel: UILabel { get }
}

protocol ViewSpinnableDelegate: class {
    func willSetLoadingScreen()
    func didRemoveLoadingScreen()
}

extension ViewSpinnable where Self: UIView {
    
    // Set the activity indicator into the main view
    internal func setLoadingScreen(view: UIView, navigationController: UINavigationController?) {
        if let spinnableSelf = self as? ViewSpinnableDelegate {
            spinnableSelf.willSetLoadingScreen()
        }
        
        // Sets the view which contains the loading text and the spinner
        let width: CGFloat = 120
        let height: CGFloat = 30
        let x = (view.frame.width / 2) - (width / 2)
        let y = (view.frame.height / 2) - (height / 2) - (navigationController?.navigationBar.frame.height)!
        loadingView.frame = CGRect(x: x, y: y, width: width, height: height)
        
        // Sets loading text
        loadingLabel.textColor = .gray
        loadingLabel.textAlignment = .center
        loadingLabel.text = "Loading..."
        loadingLabel.frame = CGRect(x: 0, y: 0, width: 140, height: 30)
        
        // Sets spinner
        spinner.activityIndicatorViewStyle = .gray
        spinner.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        if !view.subviews.contains(loadingView) {
            // Adds text and spinner to the view
            loadingView.addSubview(spinner)
            loadingView.addSubview(loadingLabel)
            
            view.addSubview(loadingView)
        }
        spinner.startAnimating()
        loadingLabel.isHidden = false
    }
    
    // Remove the activity indicator from the main view
    internal func removeLoadingScreen() {
        // Hides and stops the text and the spinner
        spinner.stopAnimating()
        spinner.isHidden = true
        loadingLabel.isHidden = true
        if let spinnableSelf = self as? ViewSpinnableDelegate {
            spinnableSelf.didRemoveLoadingScreen()
        }
    }
}
