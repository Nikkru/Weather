//
//  AllGroupsViewController.swift
//  Weather
//
//  Created by Nikolai Krusser on 22.11.2021.
//

import UIKit

class AllGroupsViewController: UIViewController {
    
    @IBOutlet weak var allGoupsTableView: UITableView!

    var header: AllGroupsHeaderFooterView!
    
    var filteredGroup: [String]!
     
    var shouldShowSearchResults = false
    
    var groups = ["Picasso",
                    "Brodsky",
                    "Zvetayeva",
                    "Пастернак",
                    "Bredbery",
                    "Country Life"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTableView()
        setupSearchBar()
    }
    
    private func configTableView() {
        
        allGoupsTableView.delegate = self
        allGoupsTableView.dataSource = self
        
        allGoupsTableView.register(UINib(nibName: "AllGroupsCell", bundle: nil),
                             forCellReuseIdentifier: "AllGroupsCell")
    }
}

extension AllGroupsViewController: UITableViewDelegate {

     func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.01) {
            if let cell = tableView.cellForRow(at: indexPath) as? AllGroupsCell {
                cell.groupImage.transform = .init(scaleX: 0.85, y: 0.85)
                cell.contentView.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            }
        }
    }
     func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 0.5,
                       options: .curveEaseIn,
                       animations: { [weak self] in
                        if let cell = self?.allGoupsTableView.cellForRow(at: indexPath) as? AllGroupsCell {
                            
                            cell.groupImage.transform = .identity
                            cell.contentView.backgroundColor = .clear
                        }
                       },
                       completion: nil)
    }
}
extension AllGroupsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if shouldShowSearchResults {
            return filteredGroup.count
        } else {
            return groups.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let customCell = tableView.dequeueReusableCell(withIdentifier: "AllGroupsCell", for: indexPath) as? AllGroupsCell else {
            return UITableViewCell()
        }
        // Configure the cell...
            let group = filteredGroup[indexPath.row]
            customCell.groupLabel.text = group
            customCell.groupImage.image = UIImage(named: group)

        return customCell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // добавляем кастомный хедер в контроллер для вывода на экран
        let headerView = Bundle.main.loadNibNamed("AllGroupsHeaderFooterView",
                                                  owner: self,
                                                  options: nil)?.first as! AllGroupsHeaderFooterView
        
        return headerView

//}
//extension AllGroupsViewController: UISearchResultsUpdating {
//
//
//
//    func updateSearchResults(for searchController: UISearchController) {
//        filterContentForSearching(searchController.searchBar.text!)
//    }
//    private func filterContentForSearching(_ searchText: String) {
//
//        searchingGroups = groups.filter({ (group) -> Bool in
//            guard group.lowercased() == searchText.lowercased() else {
//                return false
//            }
//            return true
//        })
    }
}
extension AllGroupsViewController: UISearchBarDelegate {
    
    func setupSearchBar() {
        
        filteredGroup = groups
        
        let customHeader = AllGroupsHeaderFooterView()
        self.header = customHeader
        
        guard let searchBar = customHeader.groupSearchBar else { return print("not found")}
        searchBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        print("search = \(searchText)")
        
        filteredGroup = searchText.isEmpty ? groups : groups.filter { (item: String) -> Bool in
            return item.range(of: searchText,
                              options: .caseInsensitive,
                              range: nil,
                              locale: nil) != nil
        }
        allGoupsTableView.reloadData()
    }
}

