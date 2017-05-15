//
//  ViewController.swift
//  iOSRecruitmentTest
//
//  Created by Bazyli Zygan on 15.06.2016.
//  Copyright © 2016 Snowdog. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(TableViewCell.self)
            tableView.addSubview(refreshControl)
            refreshControl.addTarget(self, action: #selector(updateItems), for: .valueChanged)
        }
    }
    
    let refreshControl = UIRefreshControl()
    var viewModel: ItemsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupItems()
    }
    
    func setupItems() {
        refreshControl.beginRefreshing()
        viewModel.fetchItems { [weak self] in
            self?.tableView.reloadData()
            self?.refreshControl.endRefreshing()
        }
    }
    
    func updateItems() {
        viewModel.updateItems { [weak self] in
            self?.tableView.reloadData()
            self?.refreshControl.endRefreshing()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.item = viewModel.items[indexPath.row]
        print(viewModel.items[indexPath.row].id)
        return cell
    }
}
