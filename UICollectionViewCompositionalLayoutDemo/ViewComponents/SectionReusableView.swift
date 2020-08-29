//
//  SectionReusableView.swift
//  UICollectionViewCompositionalLayoutDemo
//
//  Created by Alonso on 8/24/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import UIKit

enum ReusableViewKind: String {
    case header
    case footer
    
    var reuseIdentifier: String {
        return self.rawValue
    }
    
    var title: String? {
        switch self {
        case .header:
            return "Header title"
        case .footer:
            return "Footer title"
        }
    }
    
    var subtitle: String? {
        switch self {
        case .header:
            return "Header subtitle"
        case .footer:
            return "Footer subtitle"
        }
    }
    
}

class SectionReusableView: UICollectionReusableView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 22, weight: .bold))
        
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public
    
    func configure(with kind: ReusableViewKind) {
        titleLabel.text = kind.title
        subtitleLabel.text = kind.subtitle
    }
    
    // MARK: - Private
    
    private func setupUI() {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 5.0
        
        addSubview(stackView)
        
        stackView.fillSuperview(padding: .init(top: 12, left: 8, bottom: 12, right: 8))
    }
    
}
