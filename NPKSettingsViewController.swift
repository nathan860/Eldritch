//
//  NPKSettingsViewController.swift
//  NPKEldritchHorror
//
//  Created by Nathan Knable on 12/14/16.
//  Copyright © 2016 Nathan Knable. All rights reserved.
//

import UIKit

class NPKSettingsViewController: UIViewController {
    
    var ancientOne: String = ""
    var isCustom: Bool = false
    var segueNameEncounter: String =  "EncounterViewSegue"
    var segueNameCustom: String = "customSettings"
    var pyramidsSelected: Bool = false
    var mountainSelected: Bool = false
    var mythosCounts: Dictionary<String,Int> = [:]
    var minimumNumberOfGreenMythos: Int = 0
    var minimumNumberOfYellowMythos: Int = 0
    var minimumNumberOfBlueMythos: Int = 0
    var amountOfGreenMythosEasy: Int = 0
    var amountOfGreenMythosNormal: Int = 0
    var amountOfGreenMythosHard: Int = 0
    var amountOfYellowMythosEasy: Int = 0
    var amountOfYellowMythosNormal: Int = 0
    var amountOfYellowMythosHard: Int = 0
    var amountOfBlueMythosEasy: Int = 0
    var amountOfBlueMythosNormal: Int = 0
    var amountOfBlueMythosHard: Int = 0
    var enoughMythos: Bool = false
    var easySliderValue: Float = 0.0
    var normalSliderValue: Float = 0.0
    var hardSliderValue: Float = 0.0
    @IBOutlet var easySlider: UISlider!
    @IBOutlet var normalSlider: UISlider!
    @IBOutlet var hardSlider: UISlider!
    @IBOutlet var pyramidButton: UIButton!
    @IBOutlet var mountainButton: UIButton!
    @IBOutlet var playButton: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidDisappear(true)
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.barTintColor = UIColor.black
        self.navigationController?.navigationBar.tintColor = UIColor.red
        playButton.isHidden = true
        for (_, color) in Constants.ancientsMythosDecks[self.ancientOne]! {
            for (color, number) in color {
                switch color {
                case "Green":
                    minimumNumberOfGreenMythos += number
                case "Yellow":
                    minimumNumberOfYellowMythos += number
                case "Blue":
                    minimumNumberOfBlueMythos += number
                default:
                    print("view did load settings counting mythos cards broke")
                }
            }
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueNameEncounter {
            let destination = segue.destination as! NPKEncounterViewController
            destination.ancientOne = ancientOne
            destination.pyramidIsSelected = pyramidsSelected
            destination.mountainIsSelected = mountainSelected
            destination.mythosCounts = self.mythosCounts
        }
        
        if segue.identifier == segueNameCustom {
             let destination = segue.destination as! NPKCustomSettingsViewController
            destination.minimumNumberOfGreenMythos = minimumNumberOfGreenMythos
            destination.minimumNumberOfYellowMythos = minimumNumberOfYellowMythos
            destination.minimumNumberOfBlueMythos = minimumNumberOfBlueMythos
            destination.ancientOne = ancientOne
        }
    }
    
    @IBAction func pyramidPressed(_ sender: UIButton) {
        switch sender.isSelected {
        case true:
            sender.isSelected = false
            pyramidsSelected = false
        default:
            sender.isSelected = true
            pyramidsSelected = true
        }
    }
    
    
    @IBAction func mountainPressed(_ sender: UIButton) {
        switch sender.isSelected {
        case true:
            sender.isSelected = false
            mountainSelected = false
        default:
            sender.isSelected = true
            mountainSelected = true
        }
    }
    @IBAction func easySliderChanged(_ sender: UISlider) {
        amountOfGreenMythosEasy = Int(Float(Constants.greenMythosEasyCount) * sender.value)
        amountOfYellowMythosEasy = Int(Float(Constants.yellowMythosEasyCount) * sender.value)
        amountOfBlueMythosEasy = Int(Float(Constants.blueMythosEasyCount) * sender.value)
        checkNumberOfMythosCards()
    }

    @IBAction func normalSliderChanged(_ sender: UISlider) {
        amountOfGreenMythosNormal = Int(Float(Constants.greenMythosNormalCount) * sender.value)
        amountOfYellowMythosNormal = Int(Float(Constants.yellowMythosNormalCount) * sender.value)
        amountOfBlueMythosNormal = Int(Float(Constants.blueMythosNormalCount) * sender.value)
        checkNumberOfMythosCards()
    }

    @IBAction func hardSliderChanged(_ sender: UISlider) {
        amountOfGreenMythosHard = Int(Float(Constants.greenMythosHardCount) * sender.value)
        amountOfYellowMythosHard = Int(Float(Constants.yellowMythosHardCount) * sender.value)
        amountOfBlueMythosHard = Int(Float(Constants.blueMythosHardCount) * sender.value)
        checkNumberOfMythosCards()
    }
    
    func checkNumberOfMythosCards() {
        let greenMythosSum = amountOfGreenMythosEasy + amountOfGreenMythosNormal + amountOfGreenMythosHard
        let yellowMythosSum = amountOfYellowMythosEasy + amountOfYellowMythosNormal + amountOfYellowMythosHard
        let blueMythosSum = amountOfBlueMythosEasy + amountOfBlueMythosNormal + amountOfBlueMythosHard
        if greenMythosSum >= minimumNumberOfGreenMythos  && yellowMythosSum >= minimumNumberOfYellowMythos
                                                         && blueMythosSum >= minimumNumberOfBlueMythos{
            enoughMythos = true
            playButton.isHidden = false
            mythosCounts["GreenMythosEasy"] = amountOfGreenMythosEasy
            mythosCounts["GreenMythosNormal"] = amountOfGreenMythosNormal
            mythosCounts["GreenMythosHard"] = amountOfGreenMythosHard
            mythosCounts["YellowMythosEasy"] = amountOfYellowMythosEasy
            mythosCounts["YellowMythosNormal"] = amountOfYellowMythosNormal
            mythosCounts["YellowMythosHard"] = amountOfYellowMythosHard
            mythosCounts["BlueMythosEasy"] = amountOfBlueMythosEasy
            mythosCounts["BlueMythosNormal"] = amountOfBlueMythosNormal
            mythosCounts["BlueMythosHard"] = amountOfBlueMythosHard
        } else {
            enoughMythos = false
            playButton.isHidden = true
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
