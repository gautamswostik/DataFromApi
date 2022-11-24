//
//  JsonPostViewController.swift
//  DataFromApi
//
//  Created by swostik gautam on 20/11/2022.
//

import UIKit

class PostDataDetailViewController: UIViewController {
    
    var postData : PostModel = PostModel()
    
    
    lazy var textField : UILabel = {
        let label = UILabel()
        label.text = postData.body
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    } ()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(textField)
        view.backgroundColor = .systemBackground
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            textField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor , constant: 20),
            textField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor , constant:  -20),
        ])
       
    }
    

}
