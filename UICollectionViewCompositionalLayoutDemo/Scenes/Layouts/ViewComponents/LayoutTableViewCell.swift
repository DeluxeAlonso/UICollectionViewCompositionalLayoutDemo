//
//  LayoutTableViewCell.swift
//  UICollectionViewCompositionalLayoutDemo
//
//  Created by Alonso on 8/16/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import UIKit

class LayoutTableViewCell: UITableViewCell {
    
    var viewModel: LayoutCellViewModelProtocol? {
        didSet {
            setupBindings()
        }
    }
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    // MARK: - Lifecycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
        textLabel?.text = nil
        detailTextLabel?.text = nil
    }
    
    // MARK: - Private
    
    private func setupUI() {
        accessoryType = .disclosureIndicator
        detailTextLabel?.numberOfLines = 0
    }
    
    // MARK: - Reactive Behavior
    
    private func setupBindings() {
        textLabel?.text = viewModel?.title
        detailTextLabel?.text = viewModel?.subtitle
    }

}
