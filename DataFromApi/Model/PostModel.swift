//
//  PostModel.swift
//  DataFromApi
//
//  Created by swostik gautam on 20/11/2022.
//

import Foundation

// IF CODABLE it can do both encoe and decode
struct PostModel: Codable { 
    var userId: Int?
    var id: Int?
    var title: String?
    var body: String?
}
