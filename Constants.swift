//
//  Constants.swift
//  NPKEldritch
//
//  Created by Nathan Knable on 11/6/16.
//  Copyright © 2016 Nathan Knable. All rights reserved.
//

import Foundation

struct Constants {
    static let ancientNamesArray = ["Nephren","Abhoth", "Yig", "Azathoth", "Yog", "Niggurath", "Syzygy", "Cthulhu", "Hastur", "Elder", "Ithaqua"]
    static let characterNames = ["Agnes Baker", "Akachi Onyele", "Charlie Kane", "Dexter Drake", "Diana Stanley", "Daisy Walker", "Finn Edwards", "George Barnaby", "Hank Samson", "Harvey Walters", "Jenny Barnes", "Jim Culver", "Joe Diamond", "Jacqueline Fine", "Leo Anderson", "Lily Chen", "Lola Hayes", "Mark Harrigan", "Monterey Jack", "Marie Lambeau", "Michael Mcglen", "Mandy Thompson", "Minh Thi Phan", "Norman Withers", "Patrice Hathaway", "Rex Murphy", "Silas Marsh", "Sister Mary", "Skids O'Toole", "Tony Morgan", "Tommy Muldoon" , "Trish Scarborough", "Ursula Downs", "Wendy Adams", "Wilson Richards", "Zoey Samaras"]
    
    static let encounterNumberArray: Int = 32
    static let encounterOtherNumberCount: Int = 16
    static let gateCardNumberArray: Int = 54
    static let blueMythosEasyCount: Int = 17
    static let blueMythosNormalCount: Int = 25
    static let blueMythosHardCount: Int = 13
    static let yellowMythosEasyCount: Int = 14
    static let yellowMythosNormalCount: Int = 28
    static let yellowMythosHardCount: Int = 19
    static let greenMythosEasyCount: Int = 13
    static let greenMythosNormalCount: Int = 23
    static let greenMythosHardCount: Int = 16
    static let cellReserve: String! = "ReserveCell"

    static let ancientsCards = [
            "Abhoth": [
                "AbhothClue": 24,
                "AbhothCavern": 8,
                "AbhothSpawn": 16
            ],
            "Hastur": [
                "HasturClue": 24,
                "HasturKing": 12,
                "HasturLake": 12,
                "HasturUnspeakable": 8
            ],
            "Nephren": [
                "NephrenClue": 24,
                "NephrenPharaoh": 8,
                "NephrenWind": 8
            ],
            "Yig": [
                "YigClue": 24,
                "YigUnearthed": 8
            ],
            "Yog": [
                "YogClue": 24,
                "YogKey": 8,
                "YogVoid": 8
            ],
            "Niggurath": [
                "NiggurathClue": 24
            ],
            
            "Cthulhu": [
                "CthulhuClue": 24,
                "CthulhuRisen": 8
            ],
            "Syzygy": [
                "SyzygyClue": 24,
                "SyzygyPortal": 12,
                "SyzygyBarrier": 8
            ],
            "Azathoth": [
                "AzathothClue": 24
            ],
            "Elder": [
                "ElderClue" : 24,
                "ElderGod" :  8,
                "ElderMysterious" : 8
            ],
            "Ithaqua": [
                "IthaquaClue" : 24,
                "IthaquaHyperborea" : 8
            ]
        
    ]
    

    static let ancientsMythosDecks = [
            "Yig" : [
                "Stage1" : [
                    "Green"  : 1,
                    "Yellow" : 2,
                    "Blue"   : 1
                ],
                "Stage2" : [
                    "Green"  : 2,
                    "Yellow" : 3,
                    "Blue"   : 1
                ],
                "Stage3" : [
                    "Green"  : 2,
                    "Yellow" : 4,
                    "Blue"   : 0
                ]
            ],
            "Azathoth" : [
                "Stage1" : [
                    "Green"  : 1,
                    "Yellow" : 2,
                    "Blue"   : 1
                ],
                "Stage2" : [
                    "Green"  : 2,
                    "Yellow" : 3,
                    "Blue"   : 1
                ],
                "Stage3" : [
                    "Green"  : 2,
                    "Yellow" : 4,
                    "Blue"   : 0
                ]
            ],
            "Yog" : [
                "Stage1" : [
                    "Green"  : 0,
                    "Yellow" : 2,
                    "Blue"   : 1
                ],
                "Stage2" : [
                    "Green"  : 2,
                    "Yellow" : 3,
                    "Blue"   : 1
                ],
                "Stage3" : [
                    "Green"  : 3,
                    "Yellow" : 4,
                    "Blue"   : 0
                ]
            ],
            "Niggurath" : [
                "Stage1" : [
                    "Green"  : 1,
                    "Yellow" : 2,
                    "Blue"   : 1
                ],
                "Stage2" : [
                    "Green"  : 3,
                    "Yellow" : 2,
                    "Blue"   : 1
                ],
                "Stage3" : [
                    "Green"  : 2,
                    "Yellow" : 4,
                    "Blue"   : 0
                ]
            ],
            "Syzygy" : [
                "Stage1" : [
                    "Green"  : 0,
                    "Yellow" : 2,
                    "Blue"   : 2
                ],
                "Stage2" : [
                    "Green"  : 3,
                    "Yellow" : 3,
                    "Blue"   : 0
                ],
                "Stage3" : [
                    "Green"  : 3,
                    "Yellow" : 5,
                    "Blue"   : 0
                ]
            ],
            "Cthulhu" : [
                "Stage1" : [
                    "Green"  : 0,
                    "Yellow" : 2,
                    "Blue"   : 2
                ],
                "Stage2" : [
                    "Green"  : 1,
                    "Yellow" : 3,
                    "Blue"   : 0
                ],
                "Stage3" : [
                    "Green"  : 3,
                    "Yellow" : 4,
                    "Blue"   : 0
                ]
            ],
            "Hastur" : [
                "Stage1" : [
                    "Green"  : 0,
                    "Yellow" : 2,
                    "Blue"   : 2
                ],
                "Stage2" : [
                    "Green"  : 2,
                    "Yellow" : 3,
                    "Blue"   : 0
                ],
                "Stage3" : [
                    "Green"  : 3,
                    "Yellow" : 5,
                    "Blue"   : 0
                ]
            ],
            "Nephren" : [
                "Stage1" : [
                    "Green"  : 0,
                    "Yellow" : 2,
                    "Blue"   : 2
                ],
                "Stage2" : [
                    "Green"  : 1,
                    "Yellow" : 3,
                    "Blue"   : 0
                ],
                "Stage3" : [
                    "Green"  : 3,
                    "Yellow" : 4,
                    "Blue"   : 0
                ]
            ],
            "Abhoth" : [
                "Stage1" : [
                    "Green"  : 1,
                    "Yellow" : 2,
                    "Blue"   : 1
                ],
                "Stage2" : [
                    "Green"  : 3,
                    "Yellow" : 2,
                    "Blue"   : 1
                ],
                "Stage3" : [
                    "Green"  : 2,
                    "Yellow" : 4,
                    "Blue"   : 0
                ]
            ],
            "Elder" : [
                "Stage1" : [
                    "Green"  : 2,
                    "Yellow" : 2,
                    "Blue"   : 1
                ],
                "Stage2" : [
                    "Green"  : 3,
                    "Yellow" : 3,
                    "Blue"   : 1
                ],
                "Stage3" : [
                    "Green"  : 4,
                    "Yellow" : 4,
                    "Blue"   : 0
                ]
            ],
            "Ithaqua" : [
                "Stage1" : [
                    "Green"  : 0,
                    "Yellow" : 2,
                    "Blue"   : 2
                ],
                "Stage2" : [
                    "Green"  : 4,
                    "Yellow" : 2,
                    "Blue"   : 0
                ],
                "Stage3" : [
                    "Green"  : 2,
                    "Yellow" : 4,
                    "Blue"   : 0
                ]
        
            ]
        ]
    
    
}
