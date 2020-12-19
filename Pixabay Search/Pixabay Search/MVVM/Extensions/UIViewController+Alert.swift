//
//  UIViewController+Alert.swift
//  Pixabay Search
//
//  Created by Siju on 22/01/20.
//  Copyright © 2019 Siju. All rights reserved.
//

import UIKit

extension UIViewController {
    
    public func alert(message: String, defaultAction:Bool = true, title: String = "", actions: UIAlertAction...) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            if defaultAction{
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(action)
            }
            if !actions.isEmpty {
                actions.forEach{alertController.addAction($0)}
            }
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
}


