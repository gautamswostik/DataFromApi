//
//  JsonPostViewController.swift
//  DataFromApi
//
//  Created by swostik gautam on 20/11/2022.
//

import UIKit

class JsonPostViewController: UIViewController {
    
    let textContainer : UILabel = {
        let textLabel  = UILabel()
        textLabel.text = "Ok OK "
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.backgroundColor = .white
        textLabel.textColor = .black
        textLabel.textAlignment = .center
        
        return textLabel
    } ()
    
    lazy var containerVIew : UIView = {
        let uiv = UIView()
        uiv.translatesAutoresizingMaskIntoConstraints = false
        uiv.backgroundColor = .purple
        
        uiv.addSubview(textContainer)
        
        NSLayoutConstraint.activate([
            textContainer.centerXAnchor.constraint(equalTo: uiv.centerXAnchor),
            textContainer.centerYAnchor.constraint(equalTo: uiv.centerYAnchor),
            textContainer.heightAnchor.constraint(equalToConstant: 50),
            textContainer.widthAnchor.constraint(equalToConstant: 100)
        ])
        
            
        return uiv
    } ()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        view.addSubview(containerVIew)
        
        
        NSLayoutConstraint.activate([
            containerVIew.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor , constant: 100),
            containerVIew.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor , constant: -100),
            containerVIew.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerVIew.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerVIew.heightAnchor.constraint(equalToConstant: 100),
            containerVIew.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    

}
