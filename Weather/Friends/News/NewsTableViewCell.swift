//
//  NewsTableViewCell.swift
//  Weather
//
//  Created by Nikolai Krusser on 25.11.2021.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageImageView: UIImageView!
    @IBOutlet weak var likeItButton: UIButton!
    @IBOutlet weak var countLikeItLabel: UILabel!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var sharedButton: UIButton!
    @IBOutlet weak var countShareLabel: UILabel!
    
    var countShare = 0
    var countLikeIt = 10
    var likeIt = false {
        willSet {
            countLikeItLabel.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func sharedTappedButton(_ sender: Any) {
        countShare += 1
        countShareLabel.text = String(countShare)
    }
    @IBAction func likeItTappedButton(_ sender: Any) {
        likeIt = !likeIt
        guard likeIt != true else {
            countLikeIt += 1
            countLikeItLabel.textColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            likeItButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            return countLikeItLabel.text = String(countLikeIt)
        }
        countLikeIt -= 1
        countLikeItLabel.text = String(countLikeIt)
        likeItButton.setImage(UIImage(systemName: "heart"), for: .normal)
        countLikeItLabel.textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
    }
    @IBAction func commentTappedButton(_ sender: Any) {
        
    }
    
}
