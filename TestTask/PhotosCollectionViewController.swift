import UIKit

var albumPhotos: [Photos] = []


private let reuseIdentifier = "cell"

class PhotosCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = albumTitle

    }
    /*
     
    попробовать реализовать кеш картинок
     
    let imageCache = NSCache<NSString, UIImage>()
    
    func downloadImage(url: URL, completion: @escaping (UIImage)?) -> Void) {
        
    }
    */

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        var count = 0
        albumPhotos = []
        for photo in photos {
            if photo.albumId == albumID {
                count += 1
                albumPhotos.append(photo)
            }
        }
        return count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        
        cell.labelTitle.text = albumPhotos[indexPath.row].title
        //обработка картинки
        DispatchQueue.main.async {
            let url = URL(string: albumPhotos[indexPath.row].url)
            if let data = try? Data(contentsOf: url!)
            {
                cell.imagePhoto.image = UIImage(data: data)
                //print("Create")
            }
        }
        
    
        return cell
    }


}
