//
//  NPKPlayerTableViewCell.swift
//  NPKEldritchHorror
//
//  Created by Nathan Knable on 2/17/17.
//  Copyright © 2017 Nathan Knable. All rights reserved.
//

import UIKit

class NPKPlayerTableViewCell: UITableViewCell {

    @IBOutlet weak var textField: DictionaryTextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
