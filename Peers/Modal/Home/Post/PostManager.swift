//
//  PostManager.swift
//  Peers
//
//  Created by Chetan Sanwariya on 17/01/24.
//

import Foundation

struct PostManager {
    
    func likePost(post_Id: String){
        
        //url request
        let parameters = "{\n    \"post_Id\":\"6586b1b0a04c0ad2df785181\"\n}"
        let postData = parameters.data(using: .utf8)

        var request = URLRequest(url: URL(string: "http://localhost:3000/posts/likePost")!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "POST"
        request.httpBody = postData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
        }

        task.resume()
        
    }
    
    func unlikePost(post_Id: String){
        
        //url request
        let parameters = "{\n    \"post_Id\":\"6586b1b0a04c0ad2df785181\"\n}"
        let postData = parameters.data(using: .utf8)

        var request = URLRequest(url: URL(string: "http://localhost:3000/posts/removeLike")!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "POST"
        request.httpBody = postData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
        }

        task.resume()

    }
    
    
    func getPost(user_Id: String) -> PostModal?{
        if let path = Bundle.main.path(forResource: "PostData", ofType: "json"){
            do{
                let data = try Data(contentsOf: URL(filePath: path), options: .mappedIfSafe)
                
                let decoder = JSONDecoder()
                let post = try decoder.decode(PostModal.self, from: data)
                print(post.post_Id)
                
                return post
            } catch {
                print("error Decoding the JSON Data")
                
                return nil
            }
        }
        return nil
    }
}
