//
//  MenuViewMainController.swift
//  Peers
//
//  Created by Chetan Sanwariya on 29/01/24.
//

import UIKit

class MenuViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    static let identifier = "menuViewController"
    fileprivate let menuItems: [String] = ["Chat", "Store", "Surprize"]
    
    
    override func viewDidLoad() {
        //code to run when the View laods up
        collectionView.register(UINib(
                                nibName:"MenuViewCell", bundle: nil),
                                forCellWithReuseIdentifier: "menuViewCell"
        )
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let menuCell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuViewCell", for: indexPath) as! MenuViewCell
        menuCell.label.text = menuItems[indexPath.item]
        return menuCell
    
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 3, height: 44)
    }
    

}
