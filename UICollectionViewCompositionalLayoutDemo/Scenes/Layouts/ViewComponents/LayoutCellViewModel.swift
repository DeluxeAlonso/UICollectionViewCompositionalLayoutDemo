//
//  LayoutCellViewModel.swift
//  UICollectionViewCompositionalLayoutDemo
//
//  Created by Alonso on 8/29/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

protocol LayoutCellViewModelProtocol {
    
    var title: String? { get }
    var subtitle: String? { get }
    
}

struct LayoutCellViewModel: LayoutCellViewModelProtocol {
    
    let title: String?
    let subtitle: String?
    
    init(_ layout: CompositionalLayoutProtocol) {
        self.title = layout.title
        self.subtitle = layout.subtitle
    }
    
}
