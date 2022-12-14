//
//  ViewController.swift
//  DataFromApi
//
//  Created by swostik gautam on 20/11/2022.
//

import UIKit



class ViewController: UIViewController {
    var postData: [PostModel] = []

    
    lazy var tableView : UITableView = {
        let tableView  = UITableView()
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.postTableIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    } ()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let loader = self.loader()
        ApiManager.scope.getPosts { (postsDatas) in
            
            switch postsDatas {
            case .success(let posts):
                
                DispatchQueue.main.async {
                    self.postData = posts
                    self.tableView.reloadData()
                }
                print(self.postData)
                
            case .failure(let error):
                print(error)
                
            }
            DispatchQueue.main.async {
                self.stopLoader(loader: loader)
            }
            
            
        }

        view.addSubview(tableView)
        addNavigationBarItem()
        
    }
    
    func addNavigationBarItem() {
        let image = UIImage(systemName: "folder.fill")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil),]
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
        cell.postData = postData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextScreen = PostDataDetailViewController()
        nextScreen.postData =  postData[indexPath.row]
        navigationController?.pushViewController(nextScreen, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
}



