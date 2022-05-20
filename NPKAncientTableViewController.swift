//
//  NPKAncientTableViewController.swift
//  NPKEldritch
//
//  Created by Nathan Knable on 11/6/16.
//  Copyright © 2016 Nathan Knable. All rights reserved.
//

import UIKit

class NPKAncientTableViewController: UITableViewController {
    
    var ancientImages: Array<UIImage> = []
    var value: Float = 3
    
    var segueName = "SettingViewSeque"
    var cellIdentifier = "AncientCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for ancientName in Constants.ancientNamesArray {
            let ancientImage = UIImage(named: "\(ancientName).png")
            
            ancientImages.append(ancientImage!)
        }
        self.navigationController?.isNavigationBarHidden = true
        let rowBuffer = 40
        var rowHieght = CGFloat(self.view.frame.height) - CGFloat(rowBuffer)
        rowHieght /= CGFloat(Int(Constants.ancientNamesArray.count))
        print(rowHieght)
        self.tableView.rowHeight = rowHieght
        self.tableView.backgroundColor = UIColor.black
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constants.ancientNamesArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! NPKAncientTableViewCell

        let row = indexPath.row
        let ancient = ancientImages[row]
        cell.ancientImage.image = ancient
        cell.ancientName.text = Constants.ancientNamesArray[row]
        cell.backgroundColor = UIColor.black
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("hello")
        self.performSegue(withIdentifier: segueName, sender: self)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(segue.identifier ?? "no identifier")
        if segue.identifier == segueName {
            
            let destination = segue.destination as! NPKSettingsViewController
            let selectedRow = tableView.indexPathForSelectedRow?.row
            let ancientOne = Constants.ancientNamesArray[selectedRow!]
            destination.ancientOne = ancientOne
        }

    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("memory warning table!!!!!!!")
    }

}
