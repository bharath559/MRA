//
//  SurveyDetailTableViewController.swift
//  MRA
//
//  Created by Bharath Kongara on 11/10/15.
//  Copyright © 2015 Bharath Kongara. All rights reserved.
//

import UIKit

class SurveysListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btnExitTapped(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }

    // MARK: - Table view data source
    
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return surveryList.count;
    }
   
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("LabelTableViewCell", forIndexPath: indexPath) as! LabelTableViewCell
        
        var labelText = "Enrollment is allowed between"
       labelText = labelText + surveryList[indexPath.row].enrollStartDate
        labelText = labelText + "and" + surveryList[indexPath.row].enrollEndDate
        
        cell.tableFieldString.text=surveryList[indexPath.row].title
        cell.tableFieldValue.text=labelText
        
        cell.tag = indexPath.row
        
        return cell
    }
    
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let selectedCell = sender as! LabelTableViewCell
         let indexPath = NSIndexPath(forRow: (selectedCell.tag), inSection: 0)
        
        
        let enrollStartDate = surveryList[indexPath.row].enrollStartDate
        let enrollEndDate =  surveryList[indexPath.row].enrollEndDate
        
        
        if segue.identifier == "SurveyDetails"{
                
                let enrollViewController = segue.destinationViewController as! SurveyDetailsViewController
            
            enrollViewController.selectedSurvey = surveryList[indexPath.row] 
            
                enrollViewController.enrollStartDate = enrollStartDate
                enrollViewController.enrollEndDate = enrollEndDate
                
                
            }
            
        }

}