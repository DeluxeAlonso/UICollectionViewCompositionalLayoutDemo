//
//  LayoutsProtocols.swift
//  UICollectionViewCompositionalLayoutDemo
//
//  Created by Alonso on 2/09/21.
//  Copyright © 2021 Alonso. All rights reserved.
//

protocol LayoutsViewModelProtocol {

    func layout(at index: Int) -> CompositionalLayoutProtocol
    func makeLayoutCellViewModels() -> [AnyLayoutCellViewModel]

}

protocol LayoutsViewFactoryProtocol {

    var layouts: [CompositionalLayoutProtocol] { get }

}
