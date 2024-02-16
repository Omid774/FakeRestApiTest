//
//  UserManager.swift
//  FakeRestApiTest
//
//  Created by Omid Heydarzadeh on 2/15/24.
//

// https://jsonplaceholder.typicode.com/posts

import UIKit

struct UserManager {
    
    func fetch(completion: @escaping ([UserModel]) -> Void ) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, _, error in
            
            if let error = error { print("there is an error for fetching: \(error.localizedDescription)"); return }
            
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            
            do {
                let decodedData = try decoder.decode([UserModel].self, from: data)
                completion(decodedData)
            } catch {
                print("Error for decoding data: \(error.localizedDescription)")
            }
            
        }
       
        dataTask.resume()
        
    }
    
    func fetchImage(completion: @escaping (UIImage) -> Void ) {
        
        guard let url = URL(string: "https://www.save-free.com/cdn/https://scontent-bcn1-1.cdninstagram.com/v/t51.2885-19/365431917_815678320106123_5690402445351449711_n.jpg?_nc_ht=scontent-bcn1-1.cdninstagram.com&_nc_cat=111&_nc_ohc=NnSqKtcEaFUAX8lj6JV&edm=AEF8tYYBAAAA&ccb=7-5&oh=00_AfDxeoe99-fBJCi7eLeJteFKBbt7B05yyh1n0NtppbnOAA&oe=65D3E803&_nc_sid=1e20d2") else { return }
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, _, error in
            
            if let error = error { print("error fetching imageData: \(error.localizedDescription)"); return }
            
            guard let data = data else { return }
            
            guard let image = UIImage(data: data) else { return }
            
            print(image)
            
            completion(image)
            
        }
        
        dataTask.resume()
        
    }
    
}

