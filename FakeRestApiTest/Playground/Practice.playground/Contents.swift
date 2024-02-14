import UIKit

var greeting = "Hello, playground"

// https://reactnative.dev/movies.json

// https://jsonplaceholder.typicode.com/posts

// MARK: - Fetch

func fetch() {
    
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
    
    let dataTask = URLSession.shared.dataTask(with: url) { data, _, error in
        
        if let error = error { print("there is an error for fetching: \(error.localizedDescription)"); return }
        
        guard let data = data else { return }
        
        print(data)
        
        let dataSize = data.count
        let dataSizeInt = Double(dataSize)
        
        byteToMb(dataSizeInt)
        
    }
   
    dataTask.resume()
}

fetch()

// MARK: - Convert Byte to Megabyte

func byteToMb(_ byte: Double) {

    let convert = byte / 1_000_000

    print("\(convert) MB")

}

//byteToMb(27520)

/*
 2️⃣ 📤
 1. create function to calculate Byte to Megabyte
 2. convert data to dataSize as Double
 3. call Byte to Megabyte method and auto show both byte and MB size
 */
