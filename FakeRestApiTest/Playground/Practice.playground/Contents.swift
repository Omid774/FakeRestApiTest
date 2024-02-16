import UIKit

var greeting = "Hello, playground"

// https://reactnative.dev/movies.json

// https://jsonplaceholder.typicode.com/posts

// https://api.github.com/repos/:owner/:repo

// MARK: - Comments

/*
    playground: check data is contain image or not.
 */

func fetch() {
    
    guard let url = URL(string: "https://reactnative.dev/movies.json") else { return }
    
    let dataTask = URLSession.shared.dataTask(with: url) { data, _, error in
        
        if let error = error { print("there is an fetching error: \(error.localizedDescription)"); return }
        
        guard let data = data else { return }
        
        print(data)
        
        if let image = UIImage(data: data) { print("this data contain image.") } else {
            print("NOT IMAGE DATA")
        }
        
        print("END")
        
    }
    
    dataTask.resume()
}

fetch()
