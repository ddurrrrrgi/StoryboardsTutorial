//
//  PlayerCell.swift
//  Ratings
//
//  Created by RGP_KOREA on 2017. 1. 25..
//  Copyright © 2017년 DDRG. All rights reserved.
//

import UIKit

class PlayerCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var gameLabel: UILabel!
    @IBOutlet weak var ratingImageView: UIImageView!
    var player: Player? {
        didSet {
            nameLabel.text = player?.name
            gameLabel.text = player?.game
            
            if var rating = player?.rating {
                rating = rating < 1 ? 1 : rating
                rating = rating > 5 ? 5 : rating
                ratingImageView.image = UIImage(named: "\(rating)Stars")
            }
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

}
