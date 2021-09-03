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
                CompositionalLayoutH(),
                CompositionalLayoutI()]
    }()

    private let factory: LayoutsViewFactoryProtocol

    // MARK: - Initializers

    init(factory: LayoutsViewFactoryProtocol) {
        self.factory = factory
    }
    
    // MARK: - LayoutsViewModelProtocol
    
    func layout(at index: Int) -> CompositionalLayoutProtocol {
        return factory.layouts[index]
    }
    
    func makeLayoutCellViewModels() -> [AnyLayoutCellViewModel] {
        let cellViewModels = factory.layouts.map { LayoutCellViewModel($0) }
        return cellViewModels.map { AnyLayoutCellViewModel($0) }
    }
    
}
