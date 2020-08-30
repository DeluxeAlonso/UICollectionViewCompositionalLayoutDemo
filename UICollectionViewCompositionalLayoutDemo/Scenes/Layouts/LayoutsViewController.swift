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
    }

    // MARK: - UITableViewControllerDataSource

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfLayouts
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: LayoutTableViewCell.self, for: indexPath)
        cell.viewModel = viewModel.makeLayoutCellViewModel(for: indexPath.row)
        
        return cell
    }
    
    // MARK: - UITableViewControllerDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectedLayout = viewModel.layout(at: indexPath.row)
        let detailViewController = LayoutDetailViewController(compositionalLayout: selectedLayout)
        
        navigationController?.pushViewController(detailViewController, animated: true)
    }

}
