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
    
    var numberOfSections: Int { get }
    var numberOfRowsPerSection: Int { get }
    
    func create() -> UICollectionViewLayout
    
}

extension CompositionalLayoutProtocol {

    var numberOfSections: Int {
        return 1
    }
    
    var numberOfRowsPerSection: Int {
        return 40
    }

    func callAsFunction() -> UICollectionViewLayout {
        return create()
    }
    
}
