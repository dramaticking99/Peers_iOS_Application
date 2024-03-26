//
//  CommunityViewController.swift
//  Peers
//
//  Created by Chetan Sanwariya on 23/01/24.
//

import UIKit

class CommunityViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var menuView : UIView!
    let menuController = MenuViewController(collectionViewLayout: UICollectionViewFlowLayout())
    let colorArray : [UIColor] = [.red,.yellow,.green]
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let x = scrollView.contentOffset.x
        let offset = x/3
        menuController.menuBar.transform = CGAffineTransform(translationX: offset, y: 0)
    }
    

    override func viewDidLoad() {
    
        super.viewDidLoad()

        setUpMenuView()
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 0
            layout.minimumInteritemSpacing = 0
        }

        collectionView.backgroundColor = .systemBackground
        collectionView.isPagingEnabled = true
        
                
        self.collectionView.register(DefaultCell.self,
                                     forCellWithReuseIdentifier: DefaultCell.indentifier)
        self.collectionView.register(ChatCollectionViewCell.self,
                                     forCellWithReuseIdentifier: ChatCollectionViewCell.identifier)
        
    }
    
    //Function Setting up the menuView
    func setUpMenuView() {
        
        if let menuLayout = menuController.collectionViewLayout as? UICollectionViewFlowLayout {
            menuLayout.scrollDirection = .horizontal
            menuLayout.minimumLineSpacing = 0
            menuLayout.minimumInteritemSpacing = 0
        }
        let menuView = menuController.view!
        menuView.backgroundColor = .white
        menuView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(menuView)
        
        NSLayoutConstraint.activate([
            menuView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            menuView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menuView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            menuView.heightAnchor.constraint(equalToConstant:45)
        ])
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: menuView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if(indexPath.item == 0){
            let chatCell = collectionView.dequeueReusableCell(withReuseIdentifier: ChatCollectionViewCell.identifier, for: indexPath) as! ChatCollectionViewCell
            chatCell.delegate = self
            return chatCell
        }
        let DefaultCell = collectionView.dequeueReusableCell(withReuseIdentifier: "defaultCell" , for: indexPath)
        DefaultCell.backgroundColor = colorArray[indexPath.item]
        return DefaultCell
        

    }
    
    //MARK: - UICollectionViewDelegate Methods
    
    //MARK: - Methods to alter the size of the cell
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let height = view.frame.height - 60 - 44 - 115 - 100
            let width = view.frame.width
            return CGSize(width: width, height: height)
        
    }

}

extension CommunityViewController : CustomCollectionViewCellDelegate {
    func didSelectTableCell() {
        performSegue(withIdentifier: "chatSegue" , sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination
        destinationVC.hidesBottomBarWhenPushed = true
    }
}


