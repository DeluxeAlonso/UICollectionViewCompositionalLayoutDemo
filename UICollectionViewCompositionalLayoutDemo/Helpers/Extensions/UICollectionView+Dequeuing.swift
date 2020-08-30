//
//  UICollectionView+Dequeuing.swift
//  UICollectionViewCompositionalLayoutDemo
//
//  Created by Alonso on 8/29/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    // MARK: - Cell Register & Dequeuing
    
    func register<T: UICollectionViewCell>(cellType: T.Type) {
        let identifier = cellType.dequeuIdentifier
        register(cellType, forCellWithReuseIdentifier: identifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withReuseIdentifier: type.dequeuIdentifier, for: indexPath) as! T
    }
    
    // MARK: - Reusable View Register & Dequeuing
    
    func register<T: UICollectionReusableView>(viewType: T.Type, kind: String) {
        register(viewType, forSupplementaryViewOfKind: kind, withReuseIdentifier: kind)
    }
    
    func dequeueReusableView<T: UICollectionReusableView>(with type: T.Type,
                                                          kind: String,
                                                          for indexPath: IndexPath) -> T {
        return dequeueReusableSupplementaryView(ofKind: kind,
                                                withReuseIdentifier: kind,
                                                for: indexPath) as! T
    }
    
}
