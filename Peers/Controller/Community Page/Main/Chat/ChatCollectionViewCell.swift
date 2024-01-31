//
//  CollectionViewCell.swift
//  Peers
//
//  Created by Chetan Sanwariya on 31/01/24.
//

import UIKit

class ChatCollectionViewCell: UICollectionViewCell , UITableViewDataSource, UITableViewDelegate {
    static let identifier = "ChatCollectionViewCell"
    
    let tableView : UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemBackground
        contentView.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self

        self.tableView.register(UINib(nibName: "ChatViewCell", bundle: nil), forCellReuseIdentifier: "chatViewCell")
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //MARK: - Layout
    override func layoutSubviews() {
        super.layoutSubviews()
        tableView.frame = contentView.bounds
    }
    
    //MARK: - tableViewDelegate Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chatViewCell") as! ChatViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72.00
    }
}
