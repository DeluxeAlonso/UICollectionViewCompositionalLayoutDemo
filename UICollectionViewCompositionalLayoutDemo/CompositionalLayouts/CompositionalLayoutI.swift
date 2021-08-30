//
//  CompositionalLayoutI.swift
//  UICollectionViewCompositionalLayoutDemo
//
//  Created by Alonso on 20/08/21.
//  Copyright © 2021 Alonso. All rights reserved.
//

import UIKit

struct CompositionalLayoutI: CompositionalLayoutProtocol {

    var title: String? {
        return "Style I"
    }

    var subtitle: String? {
        return nil
    }

    func create() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (section: Int, environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            let leadingItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: NSCollectionLayoutDimension.fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
            leadingItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
            let leadingGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.7),
                                                          heightDimension: .fractionalHeight(1))
            let leadingGroup = NSCollectionLayoutGroup.vertical(layoutSize: leadingGroupSize,
                                                                subitem: leadingItem, count: 1)

            let trailingItem =  NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: NSCollectionLayoutDimension.fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
            trailingItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
            let trailingGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .fractionalHeight(1))

            let trailingGroup =  NSCollectionLayoutGroup.vertical(layoutSize: trailingGroupSize, subitem: trailingItem, count: 2)

            let containerGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                            heightDimension: .absolute(250))

            let containerGroup = NSCollectionLayoutGroup.horizontal(layoutSize: containerGroupSize,
                                                                    subitems: [leadingGroup, trailingGroup])


            let section = NSCollectionLayoutSection(group: containerGroup)
            section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0)

            return section
        }

        return layout
    }

}
