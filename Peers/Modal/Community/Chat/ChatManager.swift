//
//  ChatManager.swift
//  Peers
//
//  Created by Chetan Sanwariya on 01/02/24.
//

import Foundation

protocol ChatManagerDelegate {
    func didAddMessage()
    func didLoadMessages(messageArray : [messageModal])
}

class ChatManager {
    
    var messages : [messageModal] = []
    var delegate : ChatManagerDelegate?
    
    
    //MARK: - Messaging
    func addMessage(message: String, sender_Id: String, reciever_Id: String){
        let parameters = "{\n    \"content\":\"\(message)\",\n    \"sender_Id\":\"\(sender_Id)\",\n    \"reciever_Id\":\"\(reciever_Id)\"\n}"
        let postData = parameters.data(using: .utf8)
        
        var request = URLRequest(url: URL(string: "http://localhost:3000/chat/addMessage")!,timeoutInterval: Double.infinity)
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "POST"
        request.httpBody = postData
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
            self.delegate?.didAddMessage()
        }

        task.resume()
    }
    
     func loadMessages(sender_Id: String, reciever_Id: String){
        let parameters = "{\n    \"sender_Id\":\"\(sender_Id)\",\n    \"reciever_Id\":\"\(reciever_Id)\"\n}"
        let postData = parameters.data(using: .utf8)

        var request = URLRequest(url: URL(string: "http://localhost:3000/chat/getChat")!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "POST"
        request.httpBody = postData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
            self.messages = self.decodeJSON(data: data)
            self.delegate?.didLoadMessages(messageArray: self.messages)
        }

        task.resume()

    }
    
    func decodeJSON(data: Data) -> [messageModal] {
        var chat : Chat
        var messages : [messageModal] = []
        let decoder = JSONDecoder()
        do {
            chat = try decoder.decode(Chat.self, from: data)
            messages = chat.chat
        }
        catch {
            print(error)
        }
        
        return messages
       
    }
}
