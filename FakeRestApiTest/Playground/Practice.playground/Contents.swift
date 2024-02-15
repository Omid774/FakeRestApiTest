import UIKit

var greeting = "Hello, playground"

// https://reactnative.dev/movies.json

// https://jsonplaceholder.typicode.com/posts

// https://api.github.com/repos/:owner/:repo

// MARK: - Fetch

func fetch() {
    
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
    
    let dataTask = URLSession.shared.dataTask(with: url) { data, _, error in
        
        if let error = error { print("there is an error for fetching: \(error.localizedDescription)"); return }
        
        guard let data = data else { return }
        
        print(data)
        
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode([UserModel].self, from: data)
            print(decodedData)
            print("Success")
        } catch {
            print("Error decoding data: \(error.localizedDescription)")
            print("Failure")
        }
        
        print("End")
        
    }
   
    dataTask.resume()
}

fetch()

// MARK: - Model

struct UserModel: Decodable {
    
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
}

// MARK: - Comments

/*
 3️⃣ 📤
 1. create model json
 2. define a json decoder
 3. decoded data with consider error
 4. use do-catch block for error handling
 */
