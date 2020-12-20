//
//  ListView+Dequeue.swift
//  Pixabay Search
//
//  Created by Siju Karunakaran on 20/12/20.
//

import UIKit

extension UITableView {
    
    /// Dequeues reusable UITableViewCell using class name for indexPath.
    ///
    /// - Parameters:
    ///   - type: UITableViewCell type.
    ///   - indexPath: Cell location in tableView.
    /// - Returns: UITableViewCell object with associated class name.
    public func dequeueReusableCell<T: UITableViewCell>(ofType type: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: type.className, for: indexPath) as? T else {
            fatalError("Couldn't find UITableViewCell of class \(type.className)")
        }
        return cell
    }
    
}

extension UICollectionView {
    
    /// Dequeues reusable UITableViewCell using class name for indexPath.
    ///
    /// - Parameters:
    ///   - type: UICollectionViewCell type.
    ///   - indexPath: Cell location in collectionView.
    /// - Returns: UICollectionViewCell object with associated class name.
    public func dequeueReusableCell<T: UICollectionViewCell>(ofType type: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: type.className, for: indexPath) as? T else {
            fatalError("Couldn't find UITableViewCell of class \(type.className)")
        }
        return cell
    }
    
}
