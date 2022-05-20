//
//  Player.swift
//  NPKEldritchHorror
//
//  Created by Nathan Knable on 6/6/17.
//  Copyright © 2017 Nathan Knable. All rights reserved.
//

import UIKit

class Player: NSObject {
    var playerName: String = ""
    var numberOfCharacters: Int = 0
    var characters:[String] = [""]
    
    override init() {
        super.init()
        
    }
    
    convenience init(playerName: String) {
        self.init()
        self.playerName = playerName
    }
    
    

}
