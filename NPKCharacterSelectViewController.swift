//
//  NPKCharacterSelectViewController.swift
//  NPKEldritchHorror
//
//  Created by Nathan Knable on 2/17/17.
//  Copyright © 2017 Nathan Knable. All rights reserved.
//

import UIKit

class NPKCharacterSelectViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource, UIPopoverControllerDelegate, UIPopoverPresentationControllerDelegate {


    @IBOutlet var playerTable: UITableView!
    var dataPicker: UIPickerView = UIPickerView()
    var toolBar: UIToolbar = UIToolbar()
    var selectedTextField: DictionaryTextField = DictionaryTextField(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    var characterArray = ["Agnes Baker", "Akachi Onyele", "Charlie Kane", "Dexter Drake", "Diana Stanley", "Daisy Walker", "Finn Edwards", "George Barnaby", "Hank Samson", "Harvey Walters", "Jenny Barnes", "Jim Culver", "Joe Diamond", "Jacqueline Fine", "Leo Anderson", "Lily Chen", "Lola Hayes", "Mark Harrigan", "Monterey Jack", "Marie Lambeau", "Michael Mcglen", "Mandy Thompson", "Minh Thi Phan", "Norman Withers", "Patrice Hathaway", "Rex Murphy", "Silas Marsh", "Sister Mary", "Skids O'Toole", "Tony Morgan", "Tommy Muldoon" , "Trish Scarborough", "Ursula Downs", "Wendy Adams", "Wilson Richards", "Zoey Samaras"]
    var numberOfPlayers = 1
    var players: [Int: Player] = [1: Player.init(playerName: "Player 1")]
    let cellIdentifier = "nameIdentifier"
    let headerIdentifier = "Header"
    let popIdentifier = "popOver"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let picker = UIPickerView(frame: CGRect(x: 0, y: 200, width: view.frame.width, height: 300))
        let toolBar = UIToolbar()
        
        picker.delegate   = self
        picker.dataSource = self
        toolBar.barStyle  = UIBarStyle.default
        toolBar.tintColor = UIColor.red
        toolBar.sizeToFit()
        
        let doneButton   = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(pickerDonePressed))
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        self.playerTable.contentInset = UIEdgeInsets(top: 20,left: 0,bottom: 0,right: 0)
    
        self.dataPicker = picker
        self.toolBar = toolBar
    }
    

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("should return")
        let textField = textField as! DictionaryTextField
        let player = players[textField.playerNumber]
        player?.playerName = textField.text!
        
        textField.resignFirstResponder()
        self.playerTable.reloadData()
        print(self.players[textField.playerNumber]?.playerName ?? "oh no didn't work")
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // this is work when one of a players character fields get selected
        // once it is selected this checks to see if the field already contain a name
        // if it contains a name it clears that name and add the name back into the array of characters.
        // if it contains a name it will remove that name from the players character list
        
        let textField = textField as! DictionaryTextField
        self.selectedTextField = textField
        
        if !characterArray.contains(textField.text!) && (textField.text != "") {
            
            characterArray.append(textField.text!)
            textField.text = ""
            characterArray.sort()
        }
        
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = self.playerTable .dequeueReusableCell(withIdentifier: headerIdentifier) as! NPKSectionHeaderTableViewCell
        let player = players[section + 1]
        header.textField.text = player?.playerName
        header.textField.delegate = self
        header.textField.playerNumber = section + 1
        header.textField.type = "player"
        header.addButton.playerNumber = section + 1

        return header
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! NPKPlayerTableViewCell
        cell.textField.delegate = self
        cell.textField.inputView = self.dataPicker
        cell.textField.inputAccessoryView = self.toolBar
        cell.textField.type = "character"
        cell.textField.playerNumber = indexPath.row + 1
        print("charcter number", cell.textField.playerNumber)

        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfPlayers
    }
    
    @IBAction func addPlayerButtonPressed(_ sender: UIButton) {
        print("add player!!!!")
        self.numberOfPlayers += 1
        self.players[numberOfPlayers] = Player(playerName: "Player \(numberOfPlayers)")
        playerTable.reloadData()
    }
    
    @IBAction func addCharacterToPlayer(_ sender: AddCharacterButton) {
        print(sender.playerNumber)
        let player = players[sender.playerNumber]!
        player.numberOfCharacters = player.numberOfCharacters + 1
        playerTable.reloadData()
    }

    func pickerDonePressed(sender: Any) {
        let name = self.selectedTextField.text!
        let player = players[self.selectedTextField.playerNumber]
        player?.characters.append(name)
    
        while characterArray.contains(name) {
            print("while its here")
            let itemToRemoveIndex = characterArray.index(of: name)
            characterArray.remove(at: itemToRemoveIndex!)
        }
        
        self.dataPicker.reloadAllComponents()
        self.selectedTextField.resignFirstResponder()
        

    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let rows = characterArray.count

        return rows
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row + 1)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.numberOfPlayers = row + 1
        self.selectedTextField.text = characterArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let attributedString = NSAttributedString(string: "\(characterArray[row])", attributes: [NSForegroundColorAttributeName : UIColor.red])
        return attributedString
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var player = players[section + 1]!
        
        return player.numberOfCharacters
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "popOver" {
            let destination = segue.destination as! NPKPopOverViewController
            destination.modalPresentationStyle = UIModalPresentationStyle.popover
            destination.popoverPresentationController?.delegate = self
        }
    }
 

}
