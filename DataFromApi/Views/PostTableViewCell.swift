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
            idLabel.text = "\(postData.id ?? 0)"
        }
    }
    
    let idLabel : UILabel = {
        let uiLabel = UILabel()
        uiLabel.font = .boldSystemFont(ofSize: 20)
        uiLabel.textColor = .blue
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
        stackView.alignment = .center
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
            idContainer.heightAnchor.constraint(equalToConstant: contentView.bounds.height * 0.90),
            idContainer.widthAnchor.constraint(equalToConstant: 50),
            
            
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
