import UIKit

var user : String = ""
var userID : Int = 0


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        print(searchController.searchBar.text ?? "")
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        parseUsers()
        parseAlbums()
        parsePhotos()
        
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        // tableView.isEditing = true
        

        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        self.navigationItem.searchController = search
        
        let btnSetting = UIBarButtonItem(title: "Settings", style: .plain, target: self, action: #selector(goToSettings))
        navigationItem.rightBarButtonItem = btnSetting
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
    }
    
    @objc func goToSettings() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsTableViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    //свайпы
     
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let swipeRead = UIContextualAction(style: .normal, title: "Непрочитанное") { (action,view,success) in
        print("No Read Swipe")
        }
        //swipeRead.image = #imageLiteral(resourceName: "mail")
        swipeRead.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        return UISwipeActionsConfiguration(actions: [swipeRead])
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let swipeMore = UIContextualAction(style: .normal, title: "Еще") {
            (action, view, scene) in
            print("More")
        }
        swipeMore.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        //swipeMore.image = #imageLiteral(resourceName: "elipses")
        
        let swipeFlag = UIContextualAction(style: .normal, title: "Флаг") {
            (action, view, scene) in
            print("Flag")
        }
        swipeFlag.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        //swipeFlag.image = #imageLiteral(resourceName: "flag")
        
        let swipeAr = UIContextualAction(style: .destructive, title: "Архив") { (action, view, scene) in
            print("archive")
        }
        swipeAr.backgroundColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
        //swipeAr.image = #imageLiteral(resourceName: "trash")
        
        let conf = UISwipeActionsConfiguration(actions: [swipeAr,swipeFlag,swipeMore])
        conf.performsFirstActionWithFullSwipe = false
        
        return conf
    }
    
    
    //возвращает количество срок в секции, по умолчанию секция = 1
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
        //вернул количество из массива данных сколько элеметнов
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "idCell", for: indexPath)
        cell.textLabel?.text = users[indexPath.row].name
        return cell
         
    }
    //выбор ячейки
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        user = users[indexPath.row].name
        userID = users[indexPath.row].id
        print(userID)
        print(users[indexPath.row].name)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Users"
    }
    
    
    /*
     check commit
     code1
     code2
     */

    
    /*
     new commit after last commit
     a new realization
     code3
     code4
     code5
     */
}


