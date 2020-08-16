//
//  CompositionalLayoutD.swift
//  UICollectionViewCompositionalLayoutDemo
//
//  Created by Alonso on 8/16/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import UIKit

struct CompositionalLayoutD: CompositionalLayoutProtocol {
    
    var title: String? {
        return "Style D"
    }
    
    var subtitle: String? {
        return nil
    }
    
    var numberOfSections: Int {
        return 10
    }
    
    func create() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.5))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))
        let headerElement = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        section.boundarySupplementaryItems = [headerElement]
        section.orthogonalScrollingBehavior = .continuous
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
}
