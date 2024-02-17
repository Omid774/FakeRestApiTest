//
//  ViewController.swift
//  ProblemTableView
//
//  Created by Omid Heydarzadeh on 2/17/24.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    @IBOutlet weak var photoImageView: UIImageView!
    
    func configure(with imageURL: URL) {
        // Reset the image to avoid flickering
        photoImageView.image = nil
        
        // Load image asynchronously
        URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
            if let error = error {
                print("Error loading image: \(error)")
                return
            }
            
            // Check if data is available and create UIImage
            if let data = data, let image = UIImage(data: data) {
                // Ensure UI updates on the main thread
                DispatchQueue.main.async {
                    self.photoImageView.image = image
                }
            }
        }.resume()
    }
}

class ViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    // Example URL of the image
    let imageURL = URL(string: "https://www.save-free.com/cdn/https://scontent-bcn1-1.cdninstagram.com/v/t51.2885-19/365431917_815678320106123_5690402445351449711_n.jpg?_nc_ht=scontent-bcn1-1.cdninstagram.com&_nc_cat=111&_nc_ohc=NnSqKtcEaFUAX8lj6JV&edm=AEF8tYYBAAAA&ccb=7-5&oh=00_AfDxeoe99-fBJCi7eLeJteFKBbt7B05yyh1n0NtppbnOAA&oe=65D3E803&_nc_sid=1e20d2")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
//        tableView.register(UINib(nibName: "ImageTableViewCell", bundle: nil), forCellReuseIdentifier: "ImageTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5 // Assuming you want to display one image in the table view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! ImageTableViewCell
        cell.configure(with: imageURL)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
