import UIKit

var userAlbums : [Albums] = []
var albumTitle: String = ""
var albumID: Int = 0


class AlbumsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = user
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        userAlbums = []
        // #warning Incomplete implementation, return the number of rows
        for album in albums {
            if album.userId == userID {
                count += 1
                userAlbums.append(album)
            }
        }
        return count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "albumCell", for: indexPath)
        cell.textLabel?.text = userAlbums[indexPath.row].title
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        albumTitle = userAlbums[indexPath.row].title
        albumID = userAlbums[indexPath.row].id
        
        print("userID = \(userAlbums[indexPath.row].userId) and ID = \(userAlbums[indexPath.row].id)")
    }
    
}
