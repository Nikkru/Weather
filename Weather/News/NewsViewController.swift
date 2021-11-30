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
    var positionImage = 0
    var imageArray = ["Mickey Mouse",
                      "mickey_1",
                      "mickey_2",
                      "mickey_3"]
    let swipeGesture = UISwipeGestureRecognizer(target: NewsTableViewCell.self, action: #selector(leftSwipe(gesture:)))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTableView()
        setupGesture()
    }
    
    private func configTableView() {
        
        newsTableView.delegate = self
        newsTableView.dataSource = self
        
        newsTableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil),
                             forCellReuseIdentifier: "CustomNewCell")
        createNew(title: "Some News",
                  image: "Mickey M",
                  name: "Mickey Mouse")
    }
    
    private func setupGesture() {
      
        swipeGesture.direction = UISwipeGestureRecognizer.Direction.left

    }
    
    @objc func leftSwipe(gesture: UISwipeGestureRecognizer) {
        print("swipe left")
        positionImage += 1
    }
    
    @objc func swipeGesture(_ gesture: UISwipeGestureRecognizer) {
        
    }
    
    private func createNew(title: String, image: String, name: String) {
        let new = New(title: title,
                      image: image,
                      nameUser: name)
        news.newsArray.append(new)
    }
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
        customCell.imageImageView.addGestureRecognizer(swipeGesture)
        customCell.imageImageView.isMultipleTouchEnabled = true
        
        return customCell
    }
}
