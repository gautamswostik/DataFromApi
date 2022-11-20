//
//  PostTableViewCell.swift
//  DataFromApi
//
//  Created by swostik gautam on 20/11/2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    
    static let postTableIdentifier = "postDataIdentifier"
    
    var postData =  PostModel()
    
    lazy var textLebel : UILabel = {
        let uiLabel = UILabel()
        uiLabel.numberOfLines = 0
        uiLabel.translatesAutoresizingMaskIntoConstraints = false
        return uiLabel
    } ()
    
   
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: PostTableViewCell.postTableIdentifier)
        
        addSubview(textLebel)
        
        NSLayoutConstraint.activate([
            textLebel.leadingAnchor.constraint(equalTo: leadingAnchor , constant: 10),
            textLebel.trailingAnchor.constraint(equalTo: trailingAnchor , constant: 10)
        ])
    }
    
    
    func setPost(post: PostModel) {
        textLebel.text = post.title ?? ""
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
}
