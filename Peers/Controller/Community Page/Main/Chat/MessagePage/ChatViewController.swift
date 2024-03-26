//
//  ChatViewController.swift
//  Peers
//
//  Created by Chetan Sanwariya on 01/02/24.
//

import UIKit

class ChatViewController: UIViewController , UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate , ChatManagerDelegate, ChatSocketManagerDataDelegate{
    
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    let sender : String = "6576ad155ff5e1348672603b"
    
    //let chatManager = ChatManager()
    let chatSocketManager = ChatSocketManager()
    
    var messages : [messageModal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //chatManager.loadMessages(sender_Id: sender, reciever_Id: "655e5e38fa4803cc913c1210")
        
        tableView.dataSource = self
        tableView.delegate = self
        textField.delegate = self
        chatSocketManager.dataDelegate = self
        //chatManager.delegate = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        
        tableView.register(UINib(nibName:"SenderMessageViewCell", bundle: nil), forCellReuseIdentifier: "senderMessageViewCell")
        tableView.register(UINib(nibName: "RecieverMessageViewCell", bundle: nil), forCellReuseIdentifier: "recieverMessageViewCell")
    }
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Table view is getting reloded")
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let message = messages[indexPath.row]
        
        if(message.sender_Id == sender){
            let cell = tableView.dequeueReusableCell(withIdentifier: "senderMessageViewCell", for: indexPath) as! SenderMessageViewCell
            cell.messageLabel.text = message.content
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "recieverMessageViewCell", for: indexPath) as! RecieverMessageViewCell
        cell.messageLabel.text = message.content
        
        return cell
    }
    
    //MARK: - Table View Delegate Methods
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 89
    }
    
    //MARK: - TextField Delegate methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let message = textField.text {
//            let sender_Id = sender
//            let reciever_Id = "655e5e38fa4803cc913c1210"
            //chatManager.addMessage(message: message, sender_Id: sender_Id, reciever_Id: reciever_Id)
            chatSocketManager.sendMessage(message: message )
        }
        print(textField.text!)
        textField.text = ""
    }
    
    //MARK: - ChatManagerDelegate
    func didLoadMessages(messageArray: [messageModal]) {
        messages = messageArray
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
            let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
            self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
    
    func didAddMessage() {
        //chatManager.loadMessages(sender_Id: sender, reciever_Id: "655e5e38fa4803cc913c1210")
        DispatchQueue.main.async {
            self.tableView.reloadData()
            let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
            self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
    
    //MARK: - ChatManagerDataDelegate methods
    func didRecieveMessage(message: messageModal) {
        messages.append(message)
        print("got the message \(message)")
        tableView.reloadData()
        let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
        self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
    }
}







