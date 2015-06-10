//
//  OverViewTableViewCell.swift
//  vurbble
//
//  Created by Max Rose on 6/6/15.
//  Copyright (c) 2015 Max Rose. All rights reserved.
//

import UIKit

class OverViewTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var lastMessageLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
