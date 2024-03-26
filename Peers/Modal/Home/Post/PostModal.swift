//
//  PostModal.swift
//  Peers
//
//  Created by Chetan Sanwariya on 17/01/24.
//

import Foundation

struct PostModal : Codable {
    var post_Id : String?
    var user_Id : String?
    var arrayPost_Id : [String?]
    var arrayComments: [String?]
    var caption: String?
    var likes: Int?
    
    init(){
        post_Id = nil
        user_Id = nil
        arrayPost_Id = []
        arrayComments = []
        caption = nil
        likes = nil
    }
}
