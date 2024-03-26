//
//  messageModal.swift
//  Peers
//
//  Created by Chetan Sanwariya on 01/02/24.
//

import Foundation

struct Chat : Codable {
    let chat : [messageModal]
}

struct messageModal : Codable {
    let content : String
    let sender_Id : String
    let reciever_Id : String
}
