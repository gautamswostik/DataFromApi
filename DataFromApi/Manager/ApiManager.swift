//
//  ApiManager.swift
//  DataFromApi
//
//  Created by swostik gautam on 20/11/2022.
//

import Foundation


struct ApiConstants {
    static let BASE_URL = "https://jsonplaceholder.typicode.com/"
}

enum ApiError : Error{
    case failedToGetData
}

class ApiManager {
    static let scope = ApiManager()
    
    func getPosts(completionHandler : @escaping (Result<[PostModel] , Error>) -> Void){
        guard let url = URL(string: "\(ApiConstants.BASE_URL)posts") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {(data , response , error) in
            
            if let error = error {
                completionHandler(.failure(error))
            }

            guard let postData = data else {return}
            
            let decoder = JSONDecoder()
            
            do{
                let response = try decoder.decode([PostModel].self , from: postData)
                completionHandler(.success(response))
            }catch{
                completionHandler(.failure(error))
                print("Error While Decoding Data  \(error)")
            }
        }
        
        task.resume()
        
    }
}
