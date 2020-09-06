//
//  NumberedCollectionViewCell.swift
//  UICollectionViewCompositionalLayoutDemo
//
//  Created by Alonso on 8/16/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import UIKit

final class NumberedCollectionViewCell: UICollectionViewCell {
    
    lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .center
        
        let scaledFont = UIFont.systemFont(ofSize: 25, weight: .medium)
        label.font = UIFontMetrics.default.scaledFont(for: scaledFont)
        
        return label
    }()
    
    var number: Int = 0 {
        didSet {
            numberLabel.text = "\(number)"
        }
    }
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    // MARK: - Private
    
    private func setupUI() {
        backgroundColor = .lightGray
        
        layer.cornerRadius = 10
        
        setupLabels()
    }
    
    private func setupLabels() {
        addSubview(numberLabel)
        numberLabel.fillSuperview()
    }
    
}
