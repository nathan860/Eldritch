//
//  NPKCustomSettingsViewController.swift
//  NPKEldritchHorror
//
//  Created by Nathan Knable on 2/2/17.
//  Copyright © 2017 Nathan Knable. All rights reserved.
//

import UIKit

class NPKCustomSettingsViewController: UIViewController {
    
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
    var mythosCounts: Dictionary<String,Int> = [:]
    var ancientOne: String = ""
    var settingSegue = "sequeToSetting"
    var greenMythosSum = 0
    var yellowMythosSum = 0
    var blueMythosSum = 0
    var enoughGreenMythos = false
    var enoughYellowMythos = false
    var enoughBlueMythos = false
    @IBOutlet var greenEasyLabel: UILabel!
    @IBOutlet var greenNormalLabel: UILabel!
    @IBOutlet var greenHardLabel: UILabel!
    @IBOutlet var yellowEasyLabel: UILabel!
    @IBOutlet var yellowNormalLabel: UILabel!
    @IBOutlet var yellowHardLabel: UILabel!
    @IBOutlet var blueEasyLabel: UILabel!
    @IBOutlet var blueNormalLabel: UILabel!
    @IBOutlet var blueHardLabel: UILabel!
    @IBOutlet var greenMythosSumLabel: UILabel!
    @IBOutlet var yellowMythosSumLabel: UILabel!
    @IBOutlet var blueMythosSumLabel: UILabel!
    @IBOutlet var playButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        playButton.isHidden = true
    }
    
    func countCards() {
        greenMythosSum = Int(amountOfGreenMythosEasy + amountOfGreenMythosNormal + amountOfGreenMythosHard)
        greenMythosSumLabel.text = "\(greenMythosSum)"
        yellowMythosSum = Int(amountOfYellowMythosEasy + amountOfYellowMythosNormal + amountOfYellowMythosHard)
        yellowMythosSumLabel.text = "\(yellowMythosSum)"
        blueMythosSum = Int(amountOfBlueMythosEasy + amountOfBlueMythosNormal + amountOfBlueMythosHard)
        blueMythosSumLabel.text = "\(blueMythosSum)"

        if greenMythosSum >= minimumNumberOfGreenMythos {
            greenMythosSumLabel.textColor = UIColor.green
            enoughGreenMythos = true
            mythosCounts["GreenMythosEasy"] = amountOfGreenMythosEasy
            mythosCounts["GreenMythosNormal"] = amountOfGreenMythosNormal
            mythosCounts["GreenMythosHard"] = amountOfGreenMythosHard
        } else {
            greenMythosSumLabel.textColor = UIColor.white
            enoughGreenMythos = false
        }
        
        if yellowMythosSum >= minimumNumberOfYellowMythos {
            yellowMythosSumLabel.textColor = UIColor.green
            enoughYellowMythos = true
            mythosCounts["YellowMythosEasy"] = amountOfYellowMythosEasy
            mythosCounts["YellowMythosNormal"] = amountOfYellowMythosNormal
            mythosCounts["YellowMythosHard"] = amountOfYellowMythosHard
        } else {
            yellowMythosSumLabel.textColor = UIColor.white
            enoughYellowMythos = false
        }
        
        if blueMythosSum >= minimumNumberOfBlueMythos {
            blueMythosSumLabel.textColor = UIColor.green
            enoughBlueMythos = true
            mythosCounts["BlueMythosEasy"] = amountOfBlueMythosEasy
            mythosCounts["BlueMythosNormal"] = amountOfBlueMythosNormal
            mythosCounts["BlueMythosHard"] = amountOfBlueMythosHard
        } else {
            blueMythosSumLabel.textColor = UIColor.white
            enoughBlueMythos = false
        }
        
        if (enoughGreenMythos && enoughYellowMythos && enoughBlueMythos) {
            playButton.isHidden = false
            
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == self.settingSegue {
            var destination = segue.destination as! NPKSettingsViewController
            destination.ancientOne = self.ancientOne
            destination.mythosCounts = self.mythosCounts
            destination.isCustom = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func greenEasySliderChanged(_ sender: UISlider) {
        amountOfGreenMythosEasy = Int(sender.value)
        greenEasyLabel.text = "\(amountOfGreenMythosEasy)"
        countCards()
    }
    
    @IBAction func greenNormalSliderChanged(_ sender: UISlider) {
        amountOfGreenMythosNormal = Int(sender.value)
        greenNormalLabel.text =  "\(amountOfGreenMythosNormal)"
        countCards()
    }
    
    @IBAction func greenHardSliderChanged(_ sender: UISlider) {
        amountOfGreenMythosHard = Int(sender.value)
        greenHardLabel.text = "\(amountOfGreenMythosHard)"
        countCards()
    }
    @IBAction func yellowEasySliderChanged(_ sender: UISlider) {
        amountOfYellowMythosEasy = Int(sender.value)
        yellowEasyLabel.text = "\(amountOfYellowMythosEasy)"
        countCards()
    }
    @IBAction func yellowNormalSliderChanged(_ sender: UISlider) {
        amountOfYellowMythosNormal = Int(sender.value)
        yellowNormalLabel.text = "\(amountOfYellowMythosNormal)"
        countCards()
    }
    @IBAction func yellowHardSliderChanged(_ sender: UISlider) {
        amountOfYellowMythosHard = Int(sender.value)
        yellowHardLabel.text = "\(amountOfYellowMythosHard)"
        countCards()
    }
    @IBAction func blueEasySliderChanged(_ sender: UISlider) {
        amountOfBlueMythosEasy = Int(sender.value)
        blueEasyLabel.text = "\(amountOfBlueMythosEasy)"
        countCards()
    }
    @IBAction func blueNormalSliderChanged(_ sender: UISlider) {
        amountOfBlueMythosNormal = Int(sender.value)
        blueNormalLabel.text = "\(amountOfBlueMythosNormal)"
        countCards()
    }
    @IBAction func blueHardSliderChanged(_ sender: UISlider) {
        amountOfBlueMythosHard = Int(sender.value)
        blueHardLabel.text = "\(amountOfBlueMythosHard)"
        countCards()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
