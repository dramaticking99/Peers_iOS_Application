//
//  RecieverMessageViewCell.swift
//  Peers
//
//  Created by Chetan Sanwariya on 03/02/24.
//

import UIKit

class RecieverMessageViewCell: UITableViewCell {

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
