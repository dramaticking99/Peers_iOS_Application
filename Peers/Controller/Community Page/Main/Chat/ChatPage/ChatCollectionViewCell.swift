//
//  CollectionViewCell.swift
//  Peers
//
//  Created by Chetan Sanwariya on 31/01/24.
//

import UIKit

protocol CustomCollectionViewCellDelegate : AnyObject {
    func didSelectTableCell()
}

class ChatCollectionViewCell: UICollectionViewCell , UITableViewDataSource, UITableViewDelegate {
    static let identifier = "ChatCollectionViewCell"
    weak var delegate : CustomCollectionViewCellDelegate?
    
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
    
    //MARK: - tableViewDataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chatViewCell") as! ChatViewCell
        return cell
    }
    
    //MARK: - tableViewDelegate Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //Method to perform the seige in the Community view Controller
        delegate?.didSelectTableCell()
        
    }
    
    
    
    //MARK: - Methods altering the size of the Cell
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72.00
    }
}
