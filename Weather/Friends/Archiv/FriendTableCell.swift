//
//  FriendCell.swift
//  Weather
//
//  Created by Nikolai Krusser on 13.11.2021.
//

import UIKit

class FriendTableCell: UITableViewCell {
    
    @IBOutlet weak var nameFriendLabel: UILabel!
    @IBOutlet weak var avaFriendImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
