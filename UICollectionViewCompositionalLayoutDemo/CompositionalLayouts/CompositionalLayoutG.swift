//
//  CompositionalLayoutG.swift
//  UICollectionViewCompositionalLayoutDemo
//
//  Created by Alonso on 8/24/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import UIKit

struct CompositionalLayoutG: CompositionalLayoutProtocol {
    
    var title: String? {
        return "Style G"
    }
    
    var subtitle: String? {
        return "Layout that contains two sections and a header and footer for each of the two sections."
    }
    
    var numberOfSections: Int {
        return 2
    }
    
    var numberOfRowsPerSection: Int {
        return 3
    }
    
    func create() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .absolute(70))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])
        group.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .flexible(0),
                                                          top: nil,
                                                          trailing: nil,
                                                          bottom: nil)

        let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .estimated(50.0))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize,
                                                                 elementKind: UICollectionView.elementKindSectionHeader,
                                                                 alignment: .top)
        let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize,
                                                                 elementKind: UICollectionView.elementKindSectionFooter,
                                                                 alignment: .bottom)
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [header, footer]
        
        let layout = UICollectionViewCompositionalLayout(section: section)

        return layout
    }
    
}
