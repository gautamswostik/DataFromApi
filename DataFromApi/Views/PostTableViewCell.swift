//
//  PostTableViewCell.swift
//  DataFromApi
//
//  Created by swostik gautam on 20/11/2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    
    static let postTableIdentifier = "postDataIdentifier"
    
    var postData: PostModel = .init() {
        didSet {
            textLebel.text = postData.title ?? ""
//            idLabel.text = "1"
        }
    }
    
    let idLabel : UILabel = {
        let uiLabel = UILabel()
        uiLabel.font = .boldSystemFont(ofSize: 2)
        uiLabel.textColor = .blue
        uiLabel.text = "1"
        return uiLabel
    } ()
    
    lazy  var idContainer : UIView = {
        let idContainer = UIView()
        idContainer.layer.borderWidth = 1
        idContainer.layer.borderColor = UIColor.cyan.cgColor
        
        idContainer.addSubview(idLabel)
        return idContainer
    }()
    
    
    
    let textLebel : UILabel = {
        let uiLabel = UILabel()
        uiLabel.numberOfLines = 0
        return uiLabel
    } ()
    
    lazy var postDataStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(idContainer)
        stackView.addArrangedSubview(textLebel)
        stackView.spacing  = 20
        
        
      
        return stackView
    } ()
    
    
    
    //
    let uiScrollView : UIScrollView = {
        let scrollView = UIScrollView()
        
        return scrollView
    } ()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: PostTableViewCell.postTableIdentifier)
        
        addSubview(postDataStackView)
        
        NSLayoutConstraint.activate([
            idContainer.heightAnchor.constraint(equalToConstant: contentView.bounds.height),
            idContainer.widthAnchor.constraint(equalToConstant: 50),
            
            //ID labe; alignment
            idLabel.centerXAnchor.constraint(equalTo: idContainer.centerXAnchor),
            idLabel.centerYAnchor.constraint(equalTo: idContainer.centerYAnchor),
            
            //UiStack view constraints
            postDataStackView.trailingAnchor.constraint(equalTo: trailingAnchor , constant:  -10),
            postDataStackView.leadingAnchor.constraint(equalTo: leadingAnchor , constant: 10),
        ])
    }
    
    
    //    func setPost(post: PostModel) {
    //  textLebel.text = post.title ?? ""
    //    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    
    
}
