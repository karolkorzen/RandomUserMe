//
//  HomeViewController.swift
//  RandomUserMe API
//
//  Created by Karol Korzeń on 19/01/2022.
//

import UIKit

let cellIdentifier = "cellID"

class HomeViewController: UITableViewController {
    
    //MARK: - Data
    private var viewModel = HomeSceneViewModel()
    
    //MARK: - Properies
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        configureUI()
    }
    
    //MARK: - API
    
    func fetchData(){
        viewModel.fetchUsers {
            DispatchQueue.main.async {
                self.tableView.refreshControl?.endRefreshing()
                self.tableView.reloadData()
            }
        }
    }

    //MARK: - Selectors
    
    @objc func refreshUI(){
        fetchData()
    }
    
    //MARK: - Helpers
    
    func configureUI(){
        navigationItem.title = "randomuser.me"
        
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
        }
        
        tableView.register(UserCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.separatorStyle = .none
        
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl = refreshControl
        refreshControl?.addTarget(self, action: #selector(refreshUI), for: .valueChanged)
    }
    

}

//MARK: - UITableViewDelegate, UITableViewDataSource

extension HomeViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfUsers
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! UserCell
        cell.selectionStyle = .none
        cell.viewModel = UserViewModel(withUser: viewModel.users[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewModel = UserViewModel(withUser: viewModel.users[indexPath.row])
        let controller = DetailsViewController(withViewModel: viewModel)
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}



