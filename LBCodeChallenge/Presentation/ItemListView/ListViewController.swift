//
//  ListViewController.swift
//  LBCodeChallenge
//
//  Created by Mehtab Ahmed on 19/04/2022.
//

import UIKit

class ListViewController: UITableViewController {
    
    var listVM:ListViewModel?
    var items:[ItemCellViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBindings()
        listVM?.loadItems()
        
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }
    
    func setBindings() {
        
        listVM?.itemsFetched = { [weak self] items in
            self?.items = items
            self?.tableView.reloadData()
        }
        
        listVM?.itemsFetchFailed = { error in
            print(error)
        }
        
        listVM?.loadingStateChanged = { [weak self] shouldLoad in
            
            // shouldLoad ? SVProgressHUD.show() : SVProgressHUD.dismiss()
            if !shouldLoad {
                self?.refreshControl?.endRefreshing()
            }
        }
    }
    
    @objc private func refresh() {
        listVM?.loadItems()
    }
}


extension ListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.register(ItemTableViewCell.self, indexPath: indexPath)
        cell.config(itemVM: items[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.tabBarController?.selectedIndex == 0 ? self.show(UserDetailViewController(), sender: self) : self.show(AnimalDetailViewController(), sender: self)
        
    }
}
