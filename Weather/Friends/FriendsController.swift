//
//  FriendsController.swift
//  Weather
//
//  Created by Nikolai Krusser on 13.11.2021.
//

import UIKit

class FriendsController: UITableViewController {
    
    let segueOne = "goToFriendCollection"
    
    var friends = ["Donald",
                   "Popeye",
                   "Jerri",
                   "Scrooge",
                   "Eric Cartman",
                   "Lisa Simpson"]
    var namesSection = [String]()
    var namesDictionary = [String: [String]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        generateFriendsDictionary()
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return namesSection.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
         return namesSection[section]
     }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let namesKey = namesSection[section]
        if let nameValue = namesDictionary[namesKey] {
            return nameValue.count
        }
        return 0
//        return friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendTableCell
        let namesKey = namesSection[indexPath.section]
        if let nameValue = namesDictionary[namesKey.lowercased()] {
            let friend = nameValue[indexPath.row]
            cell.nameFriendLabel.text = friend
            cell.avaFriendImage.image = UIImage(named: friend)
            cell.setupShadowIcon()
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        guard let index = namesSection.firstIndex(of: title) else {
             return -1
         }
         return index
     }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return namesSection
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == segueOne else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let destinationVC: MyFriendController = segue.destination as! MyFriendController
        let namesKey = namesSection[indexPath.section]
        if let nameValue = namesDictionary[namesKey.lowercased()] {
            let friend = nameValue[indexPath.row]

            destinationVC.image = friend
        }
    }
    
//    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        
//    }
    override func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.01) {
            if let cell = tableView.cellForRow(at: indexPath) as? FriendTableCell {
                cell.iconView.transform = .init(scaleX: 0.85, y: 0.85)
                cell.contentView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
        }
    }
    override func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 0.5,
                       options: .curveEaseIn,
                       animations: { [weak self] in
                        if let cell = self?.tableView.cellForRow(at: indexPath) as? FriendTableCell {
                            
                            cell.iconView.transform = .identity
                            cell.contentView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                        }
                       },
                       completion: nil)
    }
    func generateFriendsDictionary() {
        for friend in friends {
            let key = "\(friend[friend.startIndex])"
            let lower = key.lowercased()
            
            if var friendNames = namesDictionary[lower] {
                friendNames.append(friend)
            } else {
                namesDictionary[lower] = [friend]
            }
        }
        namesSection = [String](namesDictionary.keys)
        namesSection = namesSection.sorted()
    }
}

