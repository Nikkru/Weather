//
//  AllGroupsViewController.swift
//  Weather
//
//  Created by Nikolai Krusser on 22.11.2021.
//

import UIKit

class AllGroupsViewController: UIViewController {
    
//    private var searchController = UISearchController()
//    private var searchingGroups = [String]()
//    private var searchBarIsEmpty: Bool {
//        guard let text = searchController.searchBar.text else {return false }
//        return text.isEmpty
//    }
    var groups = ["Picasso",
                    "Brodsky",
                    "Zvetayeva",
                    "Пастернак",
                    "Bredbery",
                    "Country Life"]
    
    @IBOutlet weak var allGoupsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTableView()

    }
    
    private func configTableView() {
        
        allGoupsTableView.delegate = self
        allGoupsTableView.dataSource = self
        
        allGoupsTableView.register(UINib(nibName: "AllGroupsCell", bundle: nil),
                             forCellReuseIdentifier: "AllGroupsCell")
        
        allGoupsTableView.register(UINib(nibName: "AllGroupsHeaderFooterView", bundle: nil), forCellReuseIdentifier: "Header")
        
//        searchController.searchResultsUpdater = self
//        searchController.obscuresBackgroundDuringPresentation = false
//        searchController.searchBar.placeholder = "Search"
//        allGoupsTableView.tableHeaderView = searchController.searchBar
//        definesPresentationContext = true
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
    // Логика удаления в редактировании
//    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//
//    func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
//        print("I was deleted")
//    }
//
//    func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
//        print("I will be edited")
//    }
//
//    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//        print("I am moving")
//    }
//
//    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//
//    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//        return .delete
//    }
}
extension AllGroupsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return arrayForCell.count
        return groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let customCell = tableView.dequeueReusableCell(withIdentifier: "AllGroupsCell", for: indexPath) as? AllGroupsCell else {
            return UITableViewCell()
        }
        // Configure the cell...
        let group = groups[indexPath.row]
        customCell.groupLabel.text = group
        customCell.groupImage.image = UIImage(named: group)
//        customCell.infoLabel.text = indexPath.row.description
//        customCell.turnOfSwitch.isOn = arrayForCell[indexPath.row] == 1
        
        return customCell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let header = UIView()
//        header.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
//        return header
        
        // добавляем кастомный хедер в контроллер для вывода на экран
       let headerView = allGoupsTableView.dequeueReusableHeaderFooterView(withIdentifier: "Header")
        return headerView
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "s"
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
}
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
//    }
//}
