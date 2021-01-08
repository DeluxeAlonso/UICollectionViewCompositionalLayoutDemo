//
//  AnyLayoutCellViewModel.swift
//  UICollectionViewCompositionalLayoutDemo
//
//  Created by Alonso on 9/5/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

struct AnyLayoutCellViewModel: Hashable, LayoutCellViewModelProtocol {

    var title: String?
    var subtitle: String?
    
    init(_ viewModel: LayoutCellViewModelProtocol) {
        self.title = viewModel.title
        self.subtitle = viewModel.subtitle
    }
    
}
