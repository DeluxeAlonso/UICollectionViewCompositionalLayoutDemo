//
//  LayoutsViewModel.swift
//  UICollectionViewCompositionalLayoutDemo
//
//  Created by Alonso on 8/16/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import Foundation

protocol LayoutsViewModelProtocol {
    
    var numberOfLayouts: Int { get }
    
    func layout(at index: Int) -> CompositionalLayoutProtocol
    func makeLayoutCellViewModel(for index: Int) -> LayoutCellViewModelProtocol
    
}

final class LayoutsViewModel: LayoutsViewModelProtocol {
    
    private lazy var layouts: [CompositionalLayoutProtocol] = {
        return [CompositionalLayoutA(),
                CompositionalLayoutB(),
                CompositionalLayoutC(),
                CompositionalLayoutD(),
                CompositionalLayoutE(),
                CompositionalLayoutF(),
                CompositionalLayoutG()]
    }()
    
    var numberOfLayouts: Int {
        return layouts.count
    }
    
    func layout(at index: Int) -> CompositionalLayoutProtocol {
        return layouts[index]
    }
    
    func makeLayoutCellViewModel(for index: Int) -> LayoutCellViewModelProtocol {
        let layout = self.layout(at: index)
        return LayoutCellViewModel(layout)
    }

}
