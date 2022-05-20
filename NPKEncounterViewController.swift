//
//  NPKEncounterViewController.swift
//  NPKEldritch
//
//  Created by Nathan Knable on 11/6/16.
//  Copyright © 2016 Nathan Knable. All rights reserved.
//

import UIKit

class NPKEncounterViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    var ancientOne = ""
    var pyramidIsSelected: Bool = false
    var mountainIsSelected: Bool = false
    var mythosCounts: Dictionary<String,Int> = [:]
    var dataController: NPKDataViewController!
    var ancientCardViewArray: Array<NPKEncounter> = []
    @IBOutlet var blackCardView: NPKEncounter!
    @IBOutlet var greenCardView: NPKEncounter!
    @IBOutlet var purpleCardView: NPKEncounter!
    @IBOutlet var orangeCardView: NPKEncounter!
    @IBOutlet var redCardView: NPKEncounter!
    @IBOutlet var antarcticaResearchView: NPKEncounter!
    @IBOutlet var brownCardView: NPKEncounter!
    @IBOutlet var blueCardView: NPKEncounter!
    @IBOutlet var yellowCardView: NPKEncounter!
    @IBOutlet var gateCardView: NPKEncounter!
    @IBOutlet var mythosCardView: NPKEncounter!
    @IBOutlet var ancientCardView1: NPKEncounter!
    @IBOutlet var ancientCardView2: NPKEncounter!
    @IBOutlet var ancientCardView3: NPKEncounter!
    @IBOutlet var ancientCardView4: NPKEncounter!
    //var reserveCards: Dictionary<String, Array<NPKEncounter>> = [:]
    var reserveCards: Array<NPKEncounter> = []
    @IBOutlet var reserveCollectionView: UICollectionView!
    @IBOutlet var mythosLabel: UILabel!
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = reserveCollectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellReserve , for: indexPath) as! NPKCardCollectionViewCell
        if reserveCards.count > 0 {
            print("collectionview index count", indexPath.count)
            //print("", collectionView.i)
            let card = reserveCards[indexPath.row]
            cell.encounterView.image = UIImage(named: card.cardFront!)

            //cell.encounterView = NPKEncounter(cardFront: card.cardFront, cardBack: nil, cardNumber: card.cardNumber, cardColor: card.cardColor, cardType: "Reserve")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let card = reserveCards[indexPath.row]
        displayCard(card: card)
        reserveCards.remove(at: indexPath.row)
        reserveCollectionView.reloadData()
    }
    
    
    func reserveCard(sender: UITapGestureRecognizer) {
        let card = sender.view as! NPKEncounter
        reserveCards.append(card)
        card.removeFromSuperview()
        reserveCollectionView.reloadData()
    }

    @IBAction func drawDeck(sender: UITapGestureRecognizer) {
        let card = sender.view as! NPKEncounter
        print("draw card:", card.cardColor ?? "non")
        var drawnCard: NPKEncounter? = nil
        if card.cardType == "Mythos" {
            print("draw mythos")
            drawnCard = dataController.drawMythos()
            
            //print("drawn card name: ", drawnCard?.cardFront ?? "non")
            mythosLabel.text = String(dataController.mythosDeck.count)
        } else {
            drawnCard = dataController.drawCardFromDeck(templateCard: card)
        }
        self.displayCard(card: drawnCard!)
    }
    
    func displayCard(card:NPKEncounter) {
        let cardReserver = UITapGestureRecognizer(target: self, action: #selector(reserveCard(sender:)))
        cardReserver.numberOfTapsRequired = 2
        let cardRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(discardActiveCard(sender:)))
        cardRecognizer.minimumPressDuration = 1
        card.isUserInteractionEnabled = true
        card.addGestureRecognizer(cardRecognizer)
        card.addGestureRecognizer(cardReserver)
        card.frame = self.view.frame
        card.image = UIImage(named: card.cardFront!)
        self.view.addSubview(card)
    }
    
    func discardActiveCard(sender: UITapGestureRecognizer){
        let view = sender.view as! NPKEncounter
        print("discard type: ", view.cardType ?? "no type")
        
        view.removeFromSuperview()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reserveCards.count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reserveCollectionView.delegate = self
        reserveCollectionView.dataSource = self
        self.navigationController?.isNavigationBarHidden = true
        self.dataController = NPKDataViewController(ancient: ancientOne, pyramid: pyramidIsSelected, mountian: mountainIsSelected,
                                                    mythosCounts: self.mythosCounts)
        self.setup()
        
    }
    
    func setup() {
        ancientCardViewArray = [ancientCardView1,ancientCardView2,ancientCardView3,ancientCardView4]
        var count = 0
        for  (cardName, _) in dataController.ancientDecks {
            ancientCardViewArray[count].cardFront = cardName
            ancientCardViewArray[count].image = UIImage(named: cardName)
            ancientCardViewArray[count].cardType = "Ancient"
            count += 1
        }
        blackCardView.cardColor = "Black"
        blackCardView.cardType = "Color"
        greenCardView.cardColor = "Green"
        greenCardView.cardType = "Color"
        purpleCardView.cardColor = "Purple"
        purpleCardView.cardType = "Color"
        orangeCardView.cardColor = "Orange"
        orangeCardView.cardType = "Color"
        if pyramidIsSelected {
            redCardView.cardColor = "Red"
            redCardView.cardType = "Color"
            redCardView.image = UIImage(named: "RedCard")
            brownCardView.cardColor = "Brown"
            brownCardView.cardType = "Color"
            brownCardView.image = UIImage(named: "BrownCard")
        } else {
            redCardView.isHidden = true
            brownCardView.isHidden = true
        }
        if mountainIsSelected {
            yellowCardView.cardColor = "Yellow"
            yellowCardView.cardType = "Color"
            yellowCardView.image = UIImage(named: "YellowCard")
            blueCardView.cardColor = "Blue"
            blueCardView.cardType = "Color"
            blueCardView.image = UIImage(named: "BlueCard")
            antarcticaResearchView.cardColor = nil
            antarcticaResearchView.cardType = "AntarcticaResearchClue"
            antarcticaResearchView.image = UIImage(named: "antarcticaResearchClue")
        } else {
            yellowCardView.isHidden = true
            blueCardView.isHidden = true
        }

        gateCardView.cardType = "Gate"
        mythosCardView.cardType = "Mythos"
        mythosLabel.text = String(dataController.mythosDeck.count)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("encounter is out of memory!!!!!!!!")
    }
}
