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
        fatalError()
    }

}
