//
//  LayoutsFactory.swift
//  UICollectionViewCompositionalLayoutDemo
//
//  Created by Alonso on 1/09/21.
//  Copyright © 2021 Alonso. All rights reserved.
//

import Foundation

protocol LayoutsViewFactoryProtocol {
    
    var layouts: [CompositionalLayoutProtocol] { get }

}

struct LayoutsFactory: LayoutsViewFactoryProtocol {

    var layouts: [CompositionalLayoutProtocol] {
        return [CompositionalLayoutA(),
                CompositionalLayoutB(),
                CompositionalLayoutC(),
                CompositionalLayoutD(),
                CompositionalLayoutE(),
                CompositionalLayoutF(),
                CompositionalLayoutG(),
                CompositionalLayoutH(),
                CompositionalLayoutI()]
    }

}
