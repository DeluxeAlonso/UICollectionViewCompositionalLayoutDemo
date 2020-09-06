//
//  LayoutsViewController.swift
//  UICollectionViewCompositionalLayoutDemo
//
//  Created by Alonso on 8/16/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import UIKit

class LayoutsViewController: UITableViewController {
    
    private let viewModel: LayoutsViewModelProtocol
    
    private var dataSource: UITableViewDiffableDataSource<LayoutsSection, AnyLayoutCellViewModel>!
    
    // MARK: - Initializers
    
    init(viewModel: LayoutsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Private
    
    private func configureUI() {
        title = "Compositional Layouts"
        configureTableView()
    }
    
    private func configureTableView() {
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
        
        tableView.register(cellType: LayoutTableViewCell.self)
        
        configureDataSource()
        updateUI()
    }
    
    private func configureDataSource() {
        dataSource = UITableViewDiffableDataSource<LayoutsSection, AnyLayoutCellViewModel>(tableView: tableView, cellProvider: { tableView, indexPath, item -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(with: LayoutTableViewCell.self, for: indexPath)
            cell.viewModel = item
            
            return cell
        })
    }
    
    private func updateUI(animated: Bool = false) {
        var currentSnapshot = NSDiffableDataSourceSnapshot<LayoutsSection, AnyLayoutCellViewModel>()
        currentSnapshot.appendSections([.main])
        currentSnapshot.appendItems(viewModel.makeLayoutCellViewModels(), toSection: .main)
        dataSource.apply(currentSnapshot, animatingDifferences: animated)
    }
    
    // MARK: - UITableViewControllerDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectedLayout = viewModel.layout(at: indexPath.row)
        let detailViewController = LayoutDetailViewController(compositionalLayout: selectedLayout)
        
        show(detailViewController, sender: nil)
    }

}
