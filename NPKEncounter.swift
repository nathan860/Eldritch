//
//  NPKEncounter.swift
//  NPKEldritch
//
//  Created by Nathan Knable on 11/6/16.
//  Copyright © 2016 Nathan Knable. All rights reserved.
//

import UIKit

class NPKEncounter: UIImageView {

    var cardFront: String?
    var cardBack: String?
    var cardNumber: Int?
    var cardColor: String?
    var cardType: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    convenience init(cardFront: String?, cardBack: String?, cardNumber: Int?, cardColor: String?, cardType: String?) {
        self.init(frame: CGRect(x: 0.0, y: 0.0, width: 2000, height: 2000))
        self.cardFront = cardFront
        self.cardBack = cardBack
        self.cardNumber = cardNumber
        self.cardColor = cardColor
    }
    
    

}
