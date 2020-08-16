//
//  MainViewController.swift
//  UICollectionViewCompositionalLayoutDemo
//
//  Created by Alonso on 8/15/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import UIKit

class LayoutDetailViewController: UIViewController {
    
    private var mainView: MainView!
    
    // MARK: - Lifecycle
    
    override func loadView() {
        mainView = MainView()
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Private
    
    private func configureUI() {
        title = "Alonso"
        configureCollectionView()
    }
    
    private func configureCollectionView() {
        let collectionView = mainView.collectionView
        
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
        collectionView.collectionViewLayout = createCompositionalLayout()
    }
    
    func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalWidth(0.5))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
}

// MARK: - UICollectionViewDataSource

extension LayoutDetailViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 40
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = .lightGray
        return cell
    }
    
}
