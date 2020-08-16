//
//  CompositionalLayoutA.swift
//  UICollectionViewCompositionalLayoutDemo
//
//  Created by Alonso on 8/15/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import UIKit

struct CompositionalLayoutA: CompositionalLayoutProtocol {
    
    var title: String? {
        return "Style A"
    }
    
    var subtitle: String? {
        return nil
    }
    
    func create() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .absolute(50))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
}
