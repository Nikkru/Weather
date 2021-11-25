//
//  FriendCell.swift
//  Weather
//
//  Created by Nikolai Krusser on 13.11.2021.
//

import UIKit

class FriendTableCell: UITableViewCell {
    
    @IBOutlet weak var iconView: IconView! 
    @IBOutlet weak var nameFriendLabel: UILabel!
    @IBOutlet weak var avaFriendImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        setupShadowIcon()
  
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setupShadowIcon() {
        iconView.layer.cornerRadius = 20
        iconView.clipsToBounds = true
//        iconView.layer.masksToBounds = false
        iconView.layer.shadowRadius = 10
        iconView.layer.shadowOpacity = 1.0
        iconView.layer.shadowOffset = CGSize(width: 3, height: 3)
        iconView.layer.shadowColor = UIColor.black.cgColor
    }
}
