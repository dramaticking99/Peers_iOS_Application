//
//  NotificationViewController.swift
//  Peers
//
//  Created by Chetan Sanwariya on 16/01/24.
//

import UIKit

class NotificationViewController: UITableViewController {

    @IBOutlet var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    
    @IBAction func searchButtonPressed(_ sender: UIBarButtonItem) {
        
    }
    
    


}
