//
//  NPKDataViewController.swift
//  NPKEldritchHorror
//
//  Created by Nathan Knable on 11/13/16.
//  Copyright © 2016 Nathan Knable. All rights reserved.
//

import UIKit

class NPKDataViewController: UIViewController {

    var ancientOne = ""
    var pyramidIsSelected = false
    var mountainIsSelected = false
    var mythosCounts: Dictionary<String, Int> = [:]
    var greenMythosDeck: Array<NPKEncounter> = []
    var yellowMythosDeck: Array<NPKEncounter> = []
    var blueMythosDeck: Array<NPKEncounter> = []
    var mythosDeck: Array<NPKEncounter> = []
    var ancientDeck1: Array<NPKEncounter> = []
    var ancientDeck2: Array<NPKEncounter> = []
    var ancientDeck3: Array<NPKEncounter> = []
    var ancientDeck4: Array<NPKEncounter> = []
    var ancientDecks: Dictionary<String, Array<NPKEncounter>> = [:]
    var encounterDecks: Dictionary<String, Array<NPKEncounter>> = [:]
    var gateEncounterDeck: Array<NPKEncounter> = Array()
    var antarcticaResearchDeck: Array<NPKEncounter> = Array()

    init(ancient: String, pyramid: Bool, mountian: Bool, mythosCounts: Dictionary<String, Int>) {
        super.init(nibName: nil, bundle: nil)
        ancientOne = ancient
        pyramidIsSelected = pyramid
        mountainIsSelected = mountian
        self.mythosCounts = mythosCounts
        setup()
    }
    
    func setup() {
        encounterDecks = [
            "Black"  : [],
            "Green"  : [],
            "Purple" : [],
            "Orange" : []
        ]
        if pyramidIsSelected {
            encounterDecks["Red"] = []
            encounterDecks["Brown"] = []
        }
        if mountainIsSelected {
            encounterDecks["Yellow"] = []
            encounterDecks["Blue"] = []
        }
        setupDecks()
    }
   
    func setupDecks() {
        setupMythosDeck()
        setupAncientDecks()
        if mountainIsSelected {
            antarcticaResearchDeck = buildDeck(cardName: "AntarcticaResearchClue",
                                              deckCount: Constants.encounterOtherNumberCount,
                                                  color: nil,
                                               cardType: "AntarcticaResearchClue")
        }
        
        for (color,_) in encounterDecks {
            var count: Int
            if color == "Red" || color == "Brown" || color == "Yellow" || color == "Blue" {
                count = Constants.encounterOtherNumberCount
            } else {
                count = Constants.encounterNumberArray
            }
            let deck = buildDeck(cardName: "\(color)Card", deckCount: count,
                                 color: color, cardType: "Color")
            
            encounterDecks[color] = deck
        }
        
        gateEncounterDeck = buildDeck(cardName: "GateCard", deckCount: Constants.gateCardNumberArray, color: nil, cardType: "Gate")
    }
    
    func drawMythos() -> NPKEncounter?{
        if mythosDeck.count > 0 {
            let mythosCard = mythosDeck[0]
            mythosDeck.remove(at: 0)
            mythosCard.isUserInteractionEnabled = true
            mythosCard.image = UIImage(named: mythosCard.cardFront!)
            mythosCard.frame = self.view.frame
            return mythosCard
        }
        return nil
    }
    
    func drawCard(deck: Array<NPKEncounter>) -> NPKEncounter{
        var newDeck = deck
        let randomIndex = Int(arc4random_uniform(UInt32(newDeck.count)))
        let randomCard = newDeck[randomIndex]
        newDeck.remove(at: randomIndex)
        print("\(randomCard.cardFront)")
        randomCard.image = UIImage(named: randomCard.cardFront!)
        return randomCard
    }
    
    func drawCardFromDeck(templateCard: NPKEncounter) -> NPKEncounter{
        var deck: Array<NPKEncounter> = []
        var drawnCard: NPKEncounter!
        if (templateCard.cardType != nil) {
            print("card type \(templateCard.cardType)")
            switch templateCard.cardType! {
            case "Gate":
                deck = gateEncounterDeck
            case "Color":
                deck = encounterDecks[templateCard.cardColor!]!
            case "Ancient":
                deck = ancientDecks[templateCard.cardFront!]!
            case "AntarcticaResearchClue":
                deck = antarcticaResearchDeck
                print("research deck count \(deck.count)")
                
            default:
                print("drawcardfromdeck couldn't find deck")
                deck = []
            }
        }
        
        if deck.count > 0 {
            drawnCard = drawCard(deck: deck)
            let index = deck.index(of: drawnCard)
            deck.remove(at: index!)
        }
        
        if templateCard.cardType != nil {
            switch templateCard.cardType! {
            case "Gate":
                gateEncounterDeck = deck
            case "Color":
                encounterDecks[templateCard.cardColor!]! = deck
            case "Ancient":
                ancientDecks[templateCard.cardFront!]! = deck
            case "AntarcticaResearchClue" :
                antarcticaResearchDeck = deck
            default:
                print("draw card from deck switch case after drawing card failed")
            }
        }
    
        if drawnCard == nil {
            print("draw a card from deck  and ran out of cards")
        }
        return drawnCard

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func buildDeck(cardName:String, deckCount: Int, color: String?, cardType: String) -> Array<NPKEncounter>{

        var deck: Array<NPKEncounter> = []
        for cardNumber in 1...deckCount {
            let imageName = "\(cardName)\(cardNumber).png"
            let card = NPKEncounter(cardFront: imageName, cardBack: nil, cardNumber: cardNumber,
                                    cardColor: color, cardType: cardType)
            
            deck.append(card)
        }
        return deck
    }
    
    func setupAncientDecks(){
        print(ancientOne)
        let ancientCards = Constants.ancientsCards[ancientOne]!
        var ancientDeckCount = 0
        
        for (card, cardCount) in ancientCards {
            let deck = buildDeck(cardName: card, deckCount: cardCount, color: nil, cardType: "Ancient")
            ancientDecks[card] = deck
            ancientDeckCount += 1
        }
    }


    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func buildMythos() {
        for (cardName, cardNumber) in mythosCounts {
            if cardNumber > 0 {
                let deck = buildDeck(cardName: cardName, deckCount: cardNumber, color: nil, cardType: "Mythos")
                if cardName.range(of: "Green") != nil {
                    greenMythosDeck.append(contentsOf: deck)
                    print("green deck count", greenMythosDeck.count)
                }
                if cardName.range(of: "Yellow") != nil {
                    yellowMythosDeck.append(contentsOf: deck)
                }
                if cardName.range(of: "Blue") != nil {
                    blueMythosDeck.append(contentsOf: deck)
                }
            }

        }
    }
    func setupMythosDeck() {
        
        let ancientMythos = Constants.ancientsMythosDecks[self.ancientOne]!
        var tempDeck1: Array<NPKEncounter> = Array()
        var tempDeck2: Array<NPKEncounter> = Array()
        var tempDeck3: Array<NPKEncounter> = Array()
        buildMythos()
        
        for (stage, colors) in ancientMythos {
            var tempDeck: Array<NPKEncounter> = Array()
            
            for (color, count) in colors {
                if color == "Green" {
                    if count > 0 {
                        for _ in 0..<count {
                            tempDeck.append(getRandomGreenCard())
                        }
                    }
                }
                if color == "Yellow" {
                    if count > 0 {
                        for _ in 0..<count {
                            tempDeck.append(getRandomYellowCard())
                        }
                    }
                }
                if color == "Blue" {
                    if count > 0 {
                        for _ in 0..<count {
                            tempDeck.append(getRandomBlueCard())
                        }
                    }
                }
            }
            switch stage {
            case "Stage1":
                tempDeck1 = tempDeck
            case "Stage2":
                tempDeck2 = tempDeck
            case "Stage3":
                tempDeck3 = tempDeck
            default:
                print("not stage")
            }
        }
        for _ in 1...tempDeck1.count {
            let randomIndex = Int(arc4random_uniform(UInt32(tempDeck1.count)))
            let randomCard = tempDeck1[randomIndex]
            tempDeck1.remove(at: randomIndex)
            mythosDeck.append(randomCard)
        }
        for _ in 1...tempDeck2.count {
            let randomIndex = Int(arc4random_uniform(UInt32(tempDeck2.count)))
            let randomCard = tempDeck2[randomIndex]
            tempDeck2.remove(at: randomIndex)
            mythosDeck.append(randomCard)
        }
        
        for _ in 1...tempDeck3.count {
            let randomIndex = Int(arc4random_uniform(UInt32(tempDeck3.count)))
            let randomCard = tempDeck3[randomIndex]
            tempDeck3.remove(at: randomIndex)
            mythosDeck.append(randomCard)
        }
        print("mythos count", mythosDeck.count)
    }

    func getRandomGreenCard() -> NPKEncounter {
        let randomIndex = Int(arc4random_uniform(UInt32(greenMythosDeck.count)))
        let randomCard = greenMythosDeck[randomIndex]
        greenMythosDeck.remove(at: randomIndex)
        return randomCard
    }
    
    func getRandomYellowCard() -> NPKEncounter {
        let randomIndex = Int(arc4random_uniform(UInt32(yellowMythosDeck.count)))
        let randomCard = yellowMythosDeck[randomIndex]
        yellowMythosDeck.remove(at: randomIndex)
        return randomCard
    }
    
    func getRandomBlueCard() -> NPKEncounter {
        let randomIndex = Int(arc4random_uniform(UInt32(blueMythosDeck.count)))
        let randomCard = blueMythosDeck[randomIndex]
        blueMythosDeck.remove(at: randomIndex)
        return randomCard
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("data is out of memory!!!!!!!!")
    }
}
