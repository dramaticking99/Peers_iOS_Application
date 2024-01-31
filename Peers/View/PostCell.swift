//
//  PostCell.swift
//  Peers
//
//  Created by Chetan Sanwariya on 03/01/24.
//

import UIKit

class PostCell: UICollectionViewCell {

    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postCaption: UILabel!
    @IBOutlet weak var postUserImage: UIImageView!
    @IBOutlet weak var postUserName: UILabel!
    @IBOutlet weak var postLikes: UILabel!
    @IBOutlet weak var postLikeButton: UIButton!
    
    let postManager = PostManager()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    
    @IBAction func likeButtonPressed(_ sender: UIButton) {
        
        if(sender.imageView?.image == UIImage(systemName: "heart")){
            
            postManager.likePost(post_Id: "6586b1b0a04c0ad2df785181")
            
            DispatchQueue.main.async {
                self.postLikeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            }
        } else {
            
            postManager.unlikePost(post_Id: "6586b1b0a04c0ad2df785181")
            
            DispatchQueue.main.async {
                self.postLikeButton.setImage(UIImage(systemName: "heart"), for: .normal)
            }
            
            
        }
        
    }
    
}
