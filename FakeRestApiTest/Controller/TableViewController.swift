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
    
    var users: [UserModel]? {
        didSet {
            DispatchQueue.main.async { [self] in
                tableView.reloadData()
            }
        }
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        configureTableView()
        
        let userManager = UserManager()
        
        userManager.fetchImage { uiImage in
            
            DispatchQueue.main.async {
                let omid = TableCell()
                omid.myImage?.image = uiImage
                self.tableView.reloadData()
            }
            
        }
        
        userManager.fetch { userModel in
            
            DispatchQueue.main.async { [self] in
                navigationItem.title = "WELCOME"
            }
            
            self.users = userModel
            
        }
        
    }

    
    // MARK: - Table View Configuration
    
    func configureTableView() {
        tableView.backgroundColor = .lightGray
        
        tableView.tableFooterView = UIView()
    }
    
    // MARK: - Table View Data Source & Delegate
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TableCell
        
        guard let user = users?[indexPath.row] else { return UITableViewCell() }
        
        cell.userIdLabel?.text = "\(user.userId)"
        cell.idLabel?.text = "\(user.id)"
        cell.titleLabel?.text = "\(user.title)"
        cell.bodyLabel?.text = "\(user.body)"
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 330
    }

}

