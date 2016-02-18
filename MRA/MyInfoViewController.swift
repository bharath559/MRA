//
//  MyInfoViewController.swift
//  MRA
//
//  Created by Bharath Kongara on 11/8/15.
//  Copyright © 2015 Bharath Kongara. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class MyInfoViewController: UITableViewController {

    var labels=[]
    var labelText=[]
    var buttonText=[]
    
    
    @IBOutlet weak var lblFullName: UILabel!
    
    @IBOutlet weak var lblEmailID: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.tableView.registerNib(UINib(nibName: "AvailableSuryves",bundle: nil), forCellReuseIdentifier: "AvailabeSurvey")
            loadCellStrings()
        self.navigationController?.navigationBarHidden = false
        self.navigationItem.hidesBackButton = true
    }
   
    
    func loadCellStrings(){
        
        labels = ["Welcome","Midas ID","Email"]
        labelText = ["Bharath Kongara","bkong002","bkong002@odu.edu"]
        buttonText = ["View Available Surveys","Settings"]
        let userProfile = UserProfile.sharedInstance
        self.lblFullName.text = userProfile.firstName+" "+userProfile.lastName
        self.lblEmailID.text =  userProfile.emailId
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   @IBAction func btnExitTapped(sender: AnyObject) {
        
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    @IBAction func btnViewSurveysTapped(sender: AnyObject) {
        
        Alamofire.Manager.sharedInstance.request(.GET, kgetSurverys).validate()
            .responseJSON { response  in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                surveryList = [SurveyDetailsModel]()
                
                switch response.result {
                    
                    
                case .Success(let data):
                    let json = JSON(data)
                    let surveyList = json["surveys"]
                    
                    for (index,subJson):(String, JSON) in surveyList {
                        
                        let surveyId:Int? = Int(subJson["id"].stringValue)
                        let eachSurvey = SurveyDetailsModel(title: subJson["title"].stringValue,description: subJson["description"].stringValue,url: subJson["url"].stringValue,surveyId: surveyId!,email: subJson["pi_email"].stringValue,enrollStartDate:subJson["enrollStartDate"].stringValue,enrollEndDate:subJson["enrollEndDate"].stringValue,notificationFrequency:subJson["frequency"].stringValue)
                        surveryList.append(eachSurvey)
                        
                        
                        print(surveryList.count)

                        }
                   
                    case .Failure(let error):
                        print("Request failed with error: \(error)")
                }
                   let vc : UIViewController = self.storyboard!.instantiateViewControllerWithIdentifier("SurveyDetailTableViewController")
                    self.navigationController?.pushViewController(vc, animated: true)
                    
        }
    }

    @IBAction func btnSettingsTapped(sender: AnyObject) {
        
        
        
    }
    
   


    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
//    
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        
//            return 4
// 
//        
//       
//    }
//    
//    
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        
//        let labelCell = tableView.dequeueReusableCellWithIdentifier("LabelTableViewCell", forIndexPath: indexPath) as! LabelTableViewCell
//       
//    
//        
//        if(indexPath.row<3){
//            
//                labelCell.tableFieldString?.text! = labels[indexPath.row] as! String
//                labelCell.tableFieldValue?.text! = labelText[indexPath.row] as! String
//            
//            return labelCell
//       }
//      else if(indexPath.row == 3){
//           
//            
//            let buttonCell = tableView.dequeueReusableCellWithIdentifier("AvailabeSurvey", forIndexPath: indexPath)
//            //let buttonCell = tableView.dequeueReusableCellWithIdentifier("ButtonTableViewCell", forIndexPath: indexPath) as! ButtonTableViewCell
//            
//            return buttonCell
//       }
//        else if(indexPath.row==4)
//        {
//            let buttonCell = tableView.dequeueReusableCellWithIdentifier("SettingsTableViewCell", forIndexPath: indexPath)
//            //let buttonCell = tableView.dequeueReusableCellWithIdentifier("ButtonTableViewCell", forIndexPath: indexPath) as! ButtonTableViewCell
//            
//            return buttonCell
//
//        }
//    
//        return labelCell;
//  
//    }
    

    @IBAction func availableSuryveysTapped(sender: AnyObject) {
    }
    
    
    @IBAction func settingsTapped(sender: AnyObject) {
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
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    


}
