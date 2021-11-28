//
//  NewsViewController.swift
//  Weather
//
//  Created by Nikolai Krusser on 24.11.2021.
//

import UIKit

class NewsViewController: UIViewController {

    @IBOutlet weak var newsTableView: UITableView!
    
    let news = News()
//    let news1 = New(title: "Fresh News", image: "mikki", nameUser: "Mickey M")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        news.newsArray.append(news1)
        
    configTableView()
        
    }
    
    private func configTableView() {
        
        newsTableView.delegate = self
        newsTableView.dataSource = self
        
        newsTableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil),
                             forCellReuseIdentifier: "CustomNewCell")
        createNew("Some News", "Mickey M", "Mickey Mouse")
    }
    
    private func createNew(_ title: String, _ image: String, _ name: String) {
        let new = New(title: title, image: image, nameUser: name)
        news.newsArray.append(new)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension NewsViewController: UITableViewDelegate {
    
     func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.01) {
            if let cell = tableView.cellForRow(at: indexPath) as? NewsTableViewCell {
                cell.imageImageView.transform = .init(scaleX: 0.85, y: 0.85)
                cell.contentView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
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
                        if let cell = self?.newsTableView.cellForRow(at: indexPath) as? NewsTableViewCell {
                            
                            cell.imageImageView.transform = .identity
                            cell.contentView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                        }
                       },
                       completion: nil)
    }
}

extension NewsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.newsArray.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let customCell = tableView.dequeueReusableCell(withIdentifier: "CustomNewCell", for: indexPath) as? NewsTableViewCell else { return UITableViewCell() }
        // Configure the cell...
        let new = news.newsArray[indexPath.row]
        customCell.titleLabel.text = new.title
        customCell.imageImageView.image = UIImage(named: new.image ?? "news")
        
        return customCell
    }
    
    
}
