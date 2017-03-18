//
//  ViewController.swift
//  Note List
//
//  Created by Carmen Chung on 11/18/16.
//  Copyright © 2016 Carmen Chung. All rights reserved.
//
import CoreData
import UIKit

class NoteListViewController: UITableViewController, MissionDetailsViewControllerDelegate {
    
    var missions = ["Sky diving", "Live in Hawaii"]
    var searchController = UISearchController(searchResultsController: nil)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    }
    func cancelButtonPressedFrom(controller: UIViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // dequeue the cell from our storyboard
        let cell = tableView.dequeueReusableCellWithIdentifier("MissionCell")!
        // All UITableViewCell objects have a build in textLabel so set it to the model that is corresponding to the row in array
        cell.textLabel?.text = missions[indexPath.row]
        // return cell so that Table View knows what to draw in each row
        return cell
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return missions.count
        
    }
    
    func missionDetailsViewController(controller: MissionDetailsViewController, didFinishAddingMission mission: String) {
        dismissViewControllerAnimated(true, completion: nil)
        missions.append(mission)
        tableView.reloadData()
    }
    
    func missionDetailsViewController(controller: MissionDetailsViewController, didFinishEditingMission mission: String, atIndexPath indexPath: Int){
        dismissViewControllerAnimated(true, completion: nil)
        missions.append(mission)
        tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        // remove the mission at indexPath
        // reload the table view
    }
    
    override func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        bit = 2
        performSegueWithIdentifier("detailSegue", sender: tableView.cellForRowAtIndexPath(indexPath))
    }
    
    var bit = 1
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let navigationController = segue.destinationViewController as! UINavigationController
        let controller = navigationController.topViewController as! MissionDetailsViewController
        controller.cancelButtonDelegate = self
        controller.delegate = self
        
        // Here we set the missionToEdit so that we can have the mission text on the MissionDetailsViewController]
        if bit == 2 {
            if let indexPath = tableView.indexPathForCell(sender as! UITableViewCell) {
                controller.missionToEdit = missions[indexPath.row]
                controller.missionToEditIndexPath = indexPath.row
                bit = 1
            }
        }
    }
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
}
