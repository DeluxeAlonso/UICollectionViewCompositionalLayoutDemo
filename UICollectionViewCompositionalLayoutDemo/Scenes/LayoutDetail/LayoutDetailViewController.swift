//
//  LayoutDetailViewController.swift
//  UICollectionViewCompositionalLayoutDemo
//
//  Created by Alonso on 8/15/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import UIKit

class LayoutDetailViewController: UIViewController {
    
    private let compositionalLayout: CompositionalLayoutProtocol
    private var layoutDetailView: LayoutDetailView!
    
    // MARK: - Initializers

    init(compositionalLayout: CompositionalLayoutProtocol) {
        self.compositionalLayout = compositionalLayout
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        layoutDetailView = LayoutDetailView()
        view = layoutDetailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI(with: compositionalLayout)
    }
    
    // MARK: - Private
    
    private func configureUI(with compositionalLayout: CompositionalLayoutProtocol) {
        title = compositionalLayout.title
        configureCollectionView(with: compositionalLayout)
    }
    
    private func configureCollectionView(with layout: CompositionalLayoutProtocol) {
        let collectionView = layoutDetailView.collectionView
        
        collectionView.dataSource = self
        
        collectionView.register(cellType: NumberedCollectionViewCell.self)
        collectionView.register(viewType: SectionHeaderView.self, kind: UICollectionView.elementKindSectionHeader)
        collectionView.register(viewType: SectionFooterView.self, kind: UICollectionView.elementKindSectionFooter)
        
        collectionView.collectionViewLayout = layout.create()
    }
    
}

// MARK: - UICollectionViewDataSource

extension LayoutDetailViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return compositionalLayout.numberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return compositionalLayout.numberOfRowsPerSection
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(with: NumberedCollectionViewCell.self, for: indexPath)
        cell.number = indexPath.row
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        return collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                               withReuseIdentifier: kind,
                                                               for: indexPath)
    }
    
}
