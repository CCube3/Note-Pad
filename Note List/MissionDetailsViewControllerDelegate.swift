//
//  MissionDetailsViewControllerDelegate.swift
//  Note List
//
//  Created by Carmen Chung on 11/18/16.
//  Copyright © 2016 Carmen Chung. All rights reserved.
//

import UIKit

protocol MissionDetailsViewControllerDelegate: class {
    func missionDetailsViewController(controller: MissionDetailsViewController, didFinishAddingMission mission: String)
    func missionDetailsViewController(controller: MissionDetailsViewController, didFinishEditingMission mission: String, atIndexPath indexPath: Int)
}
