//
//  CompositionalLayoutProtocol.swift
//  UICollectionViewCompositionalLayoutDemo
//
//  Created by Alonso on 8/15/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import UIKit

protocol CompositionalLayoutProtocol {
    
    var title: String? { get }
    var subtitle: String? { get }
    
    func create() -> UICollectionViewLayout
    
}
