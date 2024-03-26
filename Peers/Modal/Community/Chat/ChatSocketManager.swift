//
//  ChatSocketManager.swift
//  Peers
//
//  Created by Chetan Sanwariya on 13/02/24.
//

import UIKit
import Starscream

protocol ChatSocketManagerDataDelegate {
    func didRecieveMessage(message : messageModal)
}

class ChatSocketManager : WebSocketDelegate {

    var socket : WebSocket!
    
    var isConnected : Bool? = false
    
    var dataDelegate : ChatSocketManagerDataDelegate?
    
    init(){
        var request = URLRequest(url: URL(string: "ws://localhost:3001")!)
        request.timeoutInterval = 5
        socket = WebSocket(request: request)
        socket.delegate = self
        socket.connect()
        print("ChatSocket Connected !!")
    }
    
    func didReceive(event: Starscream.WebSocketEvent, client: any Starscream.WebSocketClient) {
        switch event {
            case .connected(let headers):
                isConnected = true
                print("websocket is connected: \(headers)")
            case .disconnected(let reason, let code):
                isConnected = false
                print("websocket is disconnected: \(reason) with code: \(code)")
            case .text(let string):
                print("Received text: \(string)")
                RecievedMessage(jsonString: string)
            case .binary(let data):
                print("Received data: \(data.count)")
            case .ping(_):
                break
            case .pong(_):
                break
            case .viabilityChanged(_):
                break
            case .reconnectSuggested(_):
                break
            case .cancelled:
                isConnected = false
            case .error(let error):
                isConnected = false
                print(error!)
                case .peerClosed:
                       break
            }
    }
    
    
    
    func sendMessage( message: String ){
        let content = message
        let sender_Id = "6576ad155ff5e1348672603b"
        let receiver_Id = "655e5e38fa4803cc913c1210"
        let jsonString = "{ \"content\" : \"\(content)\" , \"sender_Id\" : \"\(sender_Id)\" , \"receiver_Id\" : \"\(receiver_Id)\"}"
        socket.write(string: jsonString) {
            print ("message was sent to the server succesfully")
        }
    }
    
    func RecievedMessage( jsonString: String ){
        guard let jsonData = jsonString.data(using: .utf8) else {
            print("Failed to convert JSON String to Data")
            fatalError()
        }
        
        let decoder = JSONDecoder()
        
        do {
            let message = try decoder.decode(messageModal.self, from: jsonData)
            print(message.sender_Id)
            print(message.reciever_Id)
            print(message.content)
            dataDelegate?.didRecieveMessage(message: message)
        } catch {
            print("error decoding the JSON Data")
        }
        
    }
    
    
    

    
    
    
}
