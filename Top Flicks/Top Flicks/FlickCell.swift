//
//  FlickCell.swift
//  Top Flicks
//
//  Created by Rahul Sabnis on 1/6/17.
//  Copyright © 2017 Rahul Sabnis. All rights reserved.
//

import UIKit

class FlickCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var overviewLabel: UILabel!
    
    @IBOutlet weak var posterView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
