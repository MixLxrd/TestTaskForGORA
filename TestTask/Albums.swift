import Foundation
/*
[
{
  "userId": 1,
  "id": 1,
  "title": "quidem molestiae enim"
},
 */

//https://jsonplaceholder.typicode.com/albums

struct Albums : Decodable {
    var userId : Int
    var id : Int
    var title : String
}

var albums: [Albums] = []

func parseAlbums() {
    let urlString = "https://jsonplaceholder.typicode.com/albums"
    let semaphore = DispatchSemaphore(value: 0)
    
    guard let url = URL(string: urlString) else {return}
    URLSession.shared.dataTask(with: url) { (data,responce,error) in
        guard let data = data else {return}
        guard error == nil else {return}
        
        do {
            albums = try JSONDecoder().decode([Albums].self, from:data)
            //print(albmus)
        } catch let error {
            print(error)
        }
        semaphore.signal()
    }.resume()
    
    _ = semaphore.wait(wallTimeout: .distantFuture)
}
