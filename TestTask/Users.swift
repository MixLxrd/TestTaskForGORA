import Foundation


//jsonplaceholder.typicode.com/users
struct Users: Decodable {
    var id: Int
    var name: String
    var username: String
    var email: String
    var address: Address
    var phone: String
    var website: String
    var company: Company
}

struct Address: Decodable {
    var street: String
    var suite: String
    var city: String
    var zipcode: String
    var geo: GeoPosition
}

struct GeoPosition: Decodable {
    var lat: String
    var lng: String
}

struct Company: Decodable {
    var name: String
    var catchPhrase: String
    var bs: String
}

var users: [Users] = []

func parseUsers() {
    let urlString = "http://jsonplaceholder.typicode.com/users"
    
    let semaphore = DispatchSemaphore(value: 0)
    
    guard let url = URL(string: urlString) else { return }
    URLSession.shared.dataTask(with: url) { (data, responce, error) in
        guard let data = data else { return }
        guard error == nil else { return }
        
        do {
            users = try JSONDecoder().decode([Users].self, from: data)
            //print(users)
        } catch let error {
            print(error)
        }
        
        semaphore.signal()
    }.resume()
    
    _ = semaphore.wait(wallTimeout: .distantFuture)
}
