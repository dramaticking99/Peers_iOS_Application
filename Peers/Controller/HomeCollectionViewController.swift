//
//  HomeCollectionViewController.swift
//  Peers
//
//  Created by Chetan Sanwariya on 02/01/24.
//

import UIKit



class HomeCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        self.collectionView!.register(UINib(nibName: "PostCell", bundle: nil), 
                                      forCellWithReuseIdentifier: "postCell")
        //Resgistering the miniReelCollectionViewCell
        self.collectionView.register(MiniReelCollectionViewCell.self, forCellWithReuseIdentifier: "miniReelCollectionViewCell")
        
        

        print("the home view controller is getting called")
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int { 3 }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(section == 0 || section == 1){
            return 1
        } else {
            return 5
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if(indexPath.section == 1){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "miniReelCollectionViewCell",
                                                          for: indexPath) as! MiniReelCollectionViewCell
            return cell;
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "postCell",
                                                          for: indexPath) as! PostCell
            return cell;
            
        }
        
        
    }

    // MARK: - UICollectionViewDelegate
    
    // MARK: - Methods to alter the size of the cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width : CGFloat
        let height : CGFloat
        
        if indexPath.section == 1 {
            // First section
            width = 360
            height = 250
            return CGSizeMake(width, height)
        } else {
            // Second section
            width = 360
            height = 342
            return CGSizeMake(width, height)
        }
    }
    

    
    @IBAction func searchButtonPressed(_ sender: UIBarButtonItem) {
        
    }
    
}
