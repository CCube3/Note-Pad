//
//  MissionDetailsViewController.swift
//  Note List
//
//  Created by Carmen Chung on 11/18/16.
//  Copyright © 2016 Carmen Chung. All rights reserved.
//

import UIKit
class MissionDetailsViewController: UITableViewController {

    @IBAction func cancelBarButtonPressed(sender: UIBarButtonItem) {
        cancelButtonDelegate?.cancelButtonPressedFrom(self)
    }
    
    @IBAction func doneBarButtonPressed(sender: UIBarButtonItem) {
        // if we are editing then run the "didFinishEditingMission" method
        if var mission = missionToEdit {
            mission = newMissionTextField.text!
            delegate?.missionDetailsViewController(self, didFinishEditingMission: mission, atIndexPath: missionToEditIndexPath!)
        } else { // we are adding so run the "didFinishAddingMission" method
            print("asf'")
            print(newMissionTextField)
            let mission = newMissionTextField.text!
            delegate?.missionDetailsViewController(self, didFinishAddingMission: mission)
        }
    }
    
    
    @IBOutlet weak var newMissionTextField: UITextField!
    weak var delegate: MissionDetailsViewControllerDelegate?
    weak var cancelButtonDelegate: CancelButtonDelegate?
    var missionToEdit: String?
    var missionToEditIndexPath: Int?
}
