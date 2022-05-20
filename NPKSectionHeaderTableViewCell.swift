//
//  NPKSectionHeaderTableViewCell.swift
//  NPKEldritchHorror
//
//  Created by Nathan Knable on 2/20/17.
//  Copyright © 2017 Nathan Knable. All rights reserved.
//

import UIKit

class NPKSectionHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var textField: DictionaryTextField!
    
    @IBOutlet var addButton: AddCharacterButton!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
