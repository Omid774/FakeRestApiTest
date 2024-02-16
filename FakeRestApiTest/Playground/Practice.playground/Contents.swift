import UIKit

var greeting = "Hello, playground"

// https://reactnative.dev/movies.json

// https://jsonplaceholder.typicode.com/posts

// https://api.github.com/repos/:owner/:repo

// MARK: - Comments

/*
    playground: check and receive image.
 */

let myURL = "https://www.save-free.com/cdn/https://scontent-bcn1-1.cdninstagram.com/v/t51.2885-19/365431917_815678320106123_5690402445351449711_n.jpg?_nc_ht=scontent-bcn1-1.cdninstagram.com&_nc_cat=111&_nc_ohc=NnSqKtcEaFUAX8lj6JV&edm=AEF8tYYBAAAA&ccb=7-5&oh=00_AfDxeoe99-fBJCi7eLeJteFKBbt7B05yyh1n0NtppbnOAA&oe=65D3E803&_nc_sid=1e20d2"

func fetch() -> Bool {
    
    guard let url = URL(string: myURL) else { return false }
    
    let dataTask = URLSession.shared.dataTask(with: url) { data, _, error in
        
        if let error = error { print("there is an fetching error: \(error.localizedDescription)"); return }
        
        guard let data = data else { return }
        
        let dataSize = data.count
        let doubleDataSize = Double(dataSize)
        print("\(doubleDataSize) Byte")
        byteToMegabyte(doubleDataSize)
        
        guard let imageData = UIImage(data: data) else { return }
        
        print(imageData)
        
    }
    
    dataTask.resume()
    return true
}

fetch()

func byteToMegabyte(_ x: Double) {
    let result = x / 1_000_000
    print("\(result) MB")
}
