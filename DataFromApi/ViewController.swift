//
//  ViewController.swift
//  DataFromApi
//
//  Created by swostik gautam on 20/11/2022.
//

import UIKit



class ViewController: UIViewController {
    var postData: [PostModel] = []
    
    let tableView : UITableView = {
        let tableView  = UITableView()
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.postTableIdentifier)
        return tableView
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ApiManager.scope.getPosts { (postsDatas) in
            
            switch postsDatas {
            case .success(let posts):
                self.postData = posts
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                print(self.postData)
            case .failure(let error):
                print(error)
            }
        }
        
        view.addSubview(tableView)
        setupDelegates()
    }
    
    func setupDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}


extension ViewController: UITableViewDelegate , UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postData.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.postTableIdentifier , for: indexPath) as? PostTableViewCell else {return UITableViewCell() }
        cell.setPost(post:  postData[indexPath.row])
        return cell
    }
    
     
}
