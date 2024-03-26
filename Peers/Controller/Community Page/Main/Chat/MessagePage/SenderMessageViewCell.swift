//
//  MessageViewCell.swift
//  Peers
//
//  Created by Chetan Sanwariya on 01/02/24.
//

import UIKit

class SenderMessageViewCell: UITableViewCell {

    @IBOutlet weak var messageLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        messageLabel.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

