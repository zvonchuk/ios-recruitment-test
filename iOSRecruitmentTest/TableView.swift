//
//  TableView.swift
//  Recruit2
//
//  Created by Majid on 5/9/17.
//  Copyright © 2017 Appunite. All rights reserved.
//

import UIKit

protocol ReusableView: class {
    static var identifier: String { get }
}

extension ReusableView where Self: UIView {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableView {
    
}

protocol NibLoadableView: class { }

extension NibLoadableView where Self: UIView {
    
    static var nibName: String {
        return String(describing: self)
    }
}

extension UITableViewCell: NibLoadableView { }

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.identifier)")
        }
        
        return cell
    }
    
    func register<T: UITableViewCell>(_: T.Type) where T: ReusableView, T: NibLoadableView {
        register(UINib(nibName: T.nibName, bundle: nil), forCellReuseIdentifier: T.identifier)
    }
}
