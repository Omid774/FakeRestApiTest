//
//  UserManager.swift
//  FakeRestApiTest
//
//  Created by Omid Heydarzadeh on 2/15/24.
//

// https://jsonplaceholder.typicode.com/posts

import Foundation

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
    
}

