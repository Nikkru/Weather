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
