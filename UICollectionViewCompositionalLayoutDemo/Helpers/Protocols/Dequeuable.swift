//
//  Dequeuable.swift
//  UICollectionViewCompositionalLayoutDemo
//
//  Created by Alonso on 8/29/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import UIKit

protocol Dequeuable {
    
    static var dequeuIdentifier: String { get }
    
}

extension Dequeuable where Self: UIView {
    
    static var dequeuIdentifier: String {
        return String(describing: self)
    }
    
}

extension UITableViewCell: Dequeuable { }

extension UICollectionViewCell: Dequeuable { }
