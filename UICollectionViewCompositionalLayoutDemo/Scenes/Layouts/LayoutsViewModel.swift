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
    
    func makeLayoutCellViewModel(for index: Int) -> LayoutCellViewModelProtocol
    
}

final class LayoutsViewModel: LayoutsViewModelProtocol {
    
    lazy var layouts: [CompositionalLayoutProtocol] = {
        return [CompositionalLayoutA(),
                CompositionalLayoutB(),
                CompositionalLayoutC(),
                CompositionalLayoutD(),
                CompositionalLayoutE(),
                CompositionalLayoutF(),
                CompositionalLayoutG()]
    }()
    
    func makeLayoutCellViewModel(for index: Int) -> LayoutCellViewModelProtocol {
        let layout = layouts[index]
        
        return LayoutCellViewModel(layout)
    }

}
