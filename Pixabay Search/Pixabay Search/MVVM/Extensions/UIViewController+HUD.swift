//
//  UIViewController+HUD.swift
//  Pixabay Search
//
//  Created by Siju on 22/01/20.
//  Copyright © 2020 Siju. All rights reserved.
//

import UIKit
//import NVActivityIndicatorView


extension UIViewController{//}: NVActivityIndicatorViewable{
    func showHUD(message: String?) {
        let size = CGSize(width: 30, height: 30)
//        self.startAnimating(size, message: message ?? "", type: .ballClipRotate)
    }
    
    func hideHUD() {
//        self.stopAnimating()
    }
    
}


