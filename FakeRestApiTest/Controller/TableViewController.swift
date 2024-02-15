//
//  ViewController.swift
//  FakeRestApiTest
//
//  Created by Omid Heydarzadeh on 2/14/24.
//

import UIKit

class TableViewController: UITableViewController {
    
    // MARK: - Properties
    
    let cellId: String = "CustomCell"
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .lightGray
        
//        UserManager().fetch()
        
    }

    
    // MARK: - Table View Configuration
    
    // MARK: - Table View Data Source & Delegate
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TableCell
        
//        cell.userIdLabel.text = "omid"
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 330
    }

}

