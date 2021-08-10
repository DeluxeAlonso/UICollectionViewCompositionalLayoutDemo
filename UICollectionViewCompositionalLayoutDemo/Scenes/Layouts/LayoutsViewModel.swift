//
//  LayoutsViewModel.swift
//  UICollectionViewCompositionalLayoutDemo
//
//  Created by Alonso on 8/16/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

protocol LayoutsViewModelProtocol {
    
    func layout(at index: Int) -> CompositionalLayoutProtocol
    func makeLayoutCellViewModels() -> [AnyLayoutCellViewModel]
    
}

final class LayoutsViewModel: LayoutsViewModelProtocol {
    
    private lazy var layouts: [CompositionalLayoutProtocol] = {
        return [CompositionalLayoutA(),
                CompositionalLayoutB(),
                CompositionalLayoutC(),
                CompositionalLayoutD(),
                CompositionalLayoutE(),
                CompositionalLayoutF(),
                CompositionalLayoutG(),
                CompositionalLayoutH()]
    }()
    
    // MARK: - LayoutsViewModelProtocol
    
    func layout(at index: Int) -> CompositionalLayoutProtocol {
        return layouts[index]
    }
    
    func makeLayoutCellViewModels() -> [AnyLayoutCellViewModel] {
        let cellViewModels = layouts.map { LayoutCellViewModel($0) }
        return cellViewModels.map { AnyLayoutCellViewModel($0) }
    }
    
}
