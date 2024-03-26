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
    var post = PostModal()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    
        
        if let post = postManager.getPost(user_Id: "123456789"){
            if let imagePath = Bundle.main.path(forResource: "images-1", ofType: "jpg") {
                if let image = UIImage(contentsOfFile: imagePath) {
                    postImage.image = image
                } else {
                    print("Error creating UIImage from file at path: \(imagePath)")
                }
            } else {
                print("Error finding image file in bundle.")
            }
            
            
            if let caption = post.caption {
                postCaption.text = caption
            } else {
                postCaption.text = "No caption available"
            }

            if let likes = post.likes {
                postLikes.text = "\(likes)"
            } else {
                postLikes.text = "No likes available"
            }

            postUserName.text = post.user_Id ?? "Unknown User"
        }
        
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
