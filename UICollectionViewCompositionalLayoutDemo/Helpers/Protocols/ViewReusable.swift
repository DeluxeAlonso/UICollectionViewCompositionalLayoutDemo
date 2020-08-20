//
//  ViewReusable.swift
//  UICollectionViewCompositionalLayoutDemo
//
//  Created by Alonso on 8/19/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import UIKit

protocol ViewReusable {
    
    static var reuseIdentifier: String { get }
    
}

extension ViewReusable {
    
    static var reuseIdentifier: String {
        return "\(self)"
    }
    
}

extension UITableViewCell: ViewReusable {}

extension UICollectionReusableView: ViewReusable {}
