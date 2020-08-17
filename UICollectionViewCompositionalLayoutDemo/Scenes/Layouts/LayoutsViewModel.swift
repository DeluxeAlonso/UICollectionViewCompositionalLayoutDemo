//
//  LayoutsViewModel.swift
//  UICollectionViewCompositionalLayoutDemo
//
//  Created by Alonso on 8/16/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import Foundation

protocol LayoutsViewModelProtocol {
    
    var layouts: [CompositionalLayoutProtocol] { get }
    
}

final class LayoutsViewModel: LayoutsViewModelProtocol {
    
    // MARK: - LayoutsViewModelProtocol
    
    lazy var layouts: [CompositionalLayoutProtocol] = {
        return [CompositionalLayoutA(),
                CompositionalLayoutB(),
                CompositionalLayoutC(),
                CompositionalLayoutD()]
    }()
    
}
