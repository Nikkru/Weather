//
//  AllGroupsController.swift
//  Weather
//
//  Created by Nikolai Krusser on 13.11.2021.
//

import UIKit

class All_GroupsController: UITableViewController {

    let searchController = UISearchController(searchResultsController: nil)
    
    var groups = ["Picasso",
                    "Brodsky",
                    "Zvetayeva",
                    "Пастернак",
                    "Bredbery",
                    "Country Life"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllGroupsCell", for: indexPath) as! AllGroupsCell

        // Configure the cell...
        let group = groups[indexPath.row]
        cell.groupLabel.text = group
        cell.groupImage.image = UIImage(named: group)

        return cell
    }
}



