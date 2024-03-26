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
    
    let menuBar: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        return v
    }()
    
    
    override func viewDidLoad() {
        //code to run when the View laods up
        
        collectionView.backgroundColor = .black
        collectionView.register(UINib(
                                nibName:"MenuViewCell", bundle: nil),
                                forCellWithReuseIdentifier: "menuViewCell"
        )
        
        view.addSubview(menuBar)
        menuBar.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
           
            menuBar.heightAnchor.constraint(equalToConstant: 5),
            menuBar.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3),
            menuBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menuBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            // Set constraints for position
            menuBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
        
       

        // Activate constraints
        NSLayoutConstraint.activate(constraints)
        
        
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
