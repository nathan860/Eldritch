//
//  NPKAncientTableViewCell.swift
//  NPKEldritch
//
//  Created by Nathan Knable on 11/6/16.
//  Copyright © 2016 Nathan Knable. All rights reserved.
//

import UIKit

class NPKAncientTableViewCell: UITableViewCell {

    @IBOutlet var ancientImage: UIImageView!
    @IBOutlet var ancientName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
