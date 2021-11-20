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

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendTableCell
        let friend = friends[indexPath.row]
        cell.nameFriendLabel.text = friend
        cell.avaFriendImage.image = UIImage(named: friend)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == segueOne else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let destinationVC: MyFriendController = segue.destination as! MyFriendController
        let nameFriend = friends[indexPath.row]
        destinationVC.image = nameFriend
    }

}
