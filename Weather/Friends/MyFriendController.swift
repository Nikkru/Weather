//
//  MyFriendController.swift
//  Weather
//
//  Created by Nikolai Krusser on 15.11.2021.
//

import UIKit

class MyFriendController: UIViewController{
    
    var image: String?
    
    @IBOutlet weak var friendCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // регистрируем нашу ячейку в коллекции
        self.friendCollectionView.register(UINib(nibName: "FriendCollectionCell", bundle: nil),
                                           forCellWithReuseIdentifier: "FriendCollectionCell")
        self.friendCollectionView.dataSource = self
        
    }
    
}

extension MyFriendController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        	
        var cell = UICollectionViewCell()
        if let friendCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendCollectionCell", for: indexPath) as? FriendCollectionCell {
            friendCell.setupCell(name: image)
            cell = friendCell
        }
        return cell
    }
    
     func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.5) {
            if let cell = collectionView.cellForItem(at: indexPath) as? FriendCollectionCell {
                cell.friendImage.transform = .init(scaleX: 1.5, y: 1.5)
                cell.contentView.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
            }
//            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendCollectionCell", for: indexPath) as? FriendCollectionCell {
//                cell.friendImage.transform = .init(scaleX: 0.8, y: 0.8)
//                cell.contentView.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
//            }
        }
    }    
}
