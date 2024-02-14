import UIKit

var greeting = "Hello, playground"

// https://jsonplaceholder.typicode.com/posts

// MARK: - Fetch

func fetch() {
    
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
    
    let dataTask = URLSession.shared.dataTask(with: url) { data, _, error in
        
        if let error = error { print("there is an error for fetching: \(error.localizedDescription)"); return }
        
        guard let data = data else { return }
        
        print(data)
        
    }
   
    dataTask.resume()
}

fetch()

// MARK: - Convert Byte to Megabyte

func byteToMb(_ byte: Double) {
    
    let convert = byte / 1_000_000
    
    print("\(convert) MB")
    
}

byteToMb(27520)

/*
 1️⃣ 📤
 0. start project
 1. create playground for practices
 2. in playground receive data from internet and show this data size
 */
