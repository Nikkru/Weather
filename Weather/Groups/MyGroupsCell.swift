//
//  MyGroupsCell.swift
//  Weather
//
//  Created by Nikolai Krusser on 13.11.2021.
//

import UIKit

class MyGroupsCell: UITableViewCell {

    @IBOutlet weak var myGroupLabel: UILabel!
    @IBOutlet weak var myGroupImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupShadowImage()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setupShadowImage() {
        myGroupImage.layer.cornerRadius = 20
        myGroupImage.clipsToBounds = true
        myGroupImage.layer.masksToBounds = false
        myGroupImage.layer.shadowRadius = 10
        myGroupImage.layer.shadowOpacity = 1.0
        myGroupImage.layer.shadowOffset = CGSize(width: 3, height: 3)
        myGroupImage.layer.shadowColor = UIColor.black.cgColor
    }
}
