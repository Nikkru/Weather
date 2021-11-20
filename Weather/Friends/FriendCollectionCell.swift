//
//  FriendCollectionCell.swift
//  Weather
//
//  Created by Nikolai Krusser on 15.11.2021.
//

import UIKit

class FriendCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var likeItButton: UIButton!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var friendImage: UIImageView!
    
    var friendName: String?
    var counterLikeIt = 30
    var likeIt = false {
        willSet {
            counterLabel.textColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupCell(name: friendName)
        counterLabel.text = "\(counterLikeIt)"
    }

    func setupCell(name: String?) {
        guard let friendName = name else {
            return self.friendImage.image = UIImage(named: "anonymous")
        }
        self.friendImage.image = UIImage(named: friendName)
    }
    @IBAction func tappedLikeItButton(_ sender: Any) {
        likeIt = !likeIt
        guard likeIt != true else {
            counterLikeIt += 1
            counterLabel.textColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            likeItButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            return counterLabel.text = String(counterLikeIt)
        }
        counterLikeIt -= 1
        counterLabel.text = String(counterLikeIt)
        likeItButton.setImage(UIImage(systemName: "heart"), for: .normal)
        counterLabel.textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
    }
    
}
