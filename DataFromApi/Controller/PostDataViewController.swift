//
//  JsonPostViewController.swift
//  DataFromApi
//
//  Created by swostik gautam on 20/11/2022.
//

import UIKit

class PostDataDetailViewController: UIViewController {
    
    var postData : PostModel = PostModel()
    
    lazy var idLabel : UILabel = {
        let uiLabel = UILabel()
        uiLabel.font = .boldSystemFont(ofSize: 20)
        uiLabel.textColor = .blue
        uiLabel.text = "\(postData.id ?? 0)"
        uiLabel.translatesAutoresizingMaskIntoConstraints = false
        return uiLabel
    } ()
    
    lazy  var idContainer : UIView = {
        let idContainer = UIView()
        idContainer.layer.borderWidth = 1
        idContainer.layer.borderColor = UIColor.black.cgColor
        idContainer.layer.cornerRadius = 10
        idContainer.addSubview(idLabel)
        
        NSLayoutConstraint.activate([
            idLabel.centerXAnchor.constraint(equalTo: idContainer.centerXAnchor),
            idLabel.centerYAnchor.constraint(equalTo: idContainer.centerYAnchor),
        ])
        return idContainer
    }()
    
    lazy var titleView : UILabel = {
        
        let label = UILabel()
        label.text = postData.title
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    lazy var bodyView : UILabel = {
        let label = UILabel()
        label.text = postData.body
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    lazy var titleSection : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [idContainer , titleView])
        stackView.spacing = 20
        return stackView
    } ()
    
    lazy var postDataDetailStackview : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleSection , bodyView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 30
        stackView.axis = .vertical
        return stackView
    } ()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(postDataDetailStackview)
        view.backgroundColor = .systemBackground
        navigationItem.title = postData.title
        
        
        
        
        NSLayoutConstraint.activate([
            idContainer.heightAnchor.constraint(equalToConstant: 50),
            idContainer.widthAnchor.constraint(equalToConstant: 50),
            
            postDataDetailStackview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            postDataDetailStackview.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor , constant: 20),
            postDataDetailStackview.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor , constant:  -20),
            
        ])
       
    }
    

}
