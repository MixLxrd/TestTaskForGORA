import Foundation
/*
 {
    "albumId": 1,
    "id": 1,
    "title": "accusamus beatae ad facilis cum similique qui sunt",
    "url": "https://via.placeholder.com/600/92c952",
    "thumbnailUrl": "https://via.placeholder.com/150/92c952"
  },
 */

//https://jsonplaceholder.typicode.com/photos

struct Photos : Decodable {
    var albumId : Int
    var id : Int
    var title : String
    var url : String
    var thumbnailUrl : String
}

var photos : [Photos] = []

func parsePhotos() {
    let urlString = "https://jsonplaceholder.typicode.com/photos"
    let semaphore = DispatchSemaphore(value: 0)
    
    guard let url = URL(string: urlString) else { return }
    URLSession.shared.dataTask(with: url) { (data, responce, error) in
        guard let data = data else { return }
        guard error == nil else { return }
        
        do {
            photos = try JSONDecoder().decode([Photos].self, from: data)
           // print(photos)
        } catch let error {
            print(error)
        }
        
        semaphore.signal()
    }.resume()
    
}

