//
//  AllGroupsCell.swift
//  Weather
//
//  Created by Nikolai Krusser on 13.11.2021.
//

import UIKit

class AllGroupsCell: UITableViewCell {

    @IBOutlet weak var groupLabel: UILabel!
    @IBOutlet weak var groupImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupShadowImage()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setupShadowImage() {
        groupImage.layer.cornerRadius = 20
        groupImage.clipsToBounds = true
        groupImage.layer.masksToBounds = false
        groupImage.layer.shadowRadius = 10
        groupImage.layer.shadowOpacity = 1.0
        groupImage.layer.shadowOffset = CGSize(width: 3, height: 3)
        groupImage.layer.shadowColor = UIColor.black.cgColor
    }
}
