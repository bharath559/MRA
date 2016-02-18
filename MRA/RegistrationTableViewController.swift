//
//  RegistrationTableViewController.swift
//  MRA
//
//  Created by Bharath Kongara on 2/6/16.
//  Copyright © 2016 Bharath Kongara. All rights reserved.
//
import UIKit
import Alamofire
import SwiftyJSON

class RegistrationTableViewController: UITableViewController, UITextFieldDelegate{
    
    var tableCellLabels = [String]()
    var txtFields = [UITextField]()
    
    @IBOutlet var txtFieldAccessoryView: UIToolbar!
    
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    @IBOutlet weak var nxtBarButton: UIBarButtonItem!
    @IBOutlet weak var prvBarButton: UIBarButtonItem!
    
    @IBOutlet var footerView: UIView!
    
    var activeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableCellLabels.append("Email")
        tableCellLabels.append("Password")
        tableCellLabels.append("First Name")
        tableCellLabels.append("Last Name")
        tableCellLabels.append("Gender")
        tableCellLabels.append("Race")
        tableCellLabels.append("MaritalStatus")
        
        
        tableView.estimatedRowHeight=60
        tableView.rowHeight=UITableViewAutomaticDimension
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableCellLabels.count;
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("LabelTableViewCell", forIndexPath: indexPath) as! LabelTableViewCell
        
        //let buttonCell = tableView.dequeueReusableCellWithIdentifier("ButtonTableViewCell", forIndexPath: indexPath) as! ButtonTableViewCell
        
        cell.tableTextFieldValue.delegate = self
        cell.tableTextFieldValue.inputAccessoryView = self.txtFieldAccessoryView
        
        if(indexPath.row==1){
            cell.tableTextFieldValue.secureTextEntry = true 
        }
        
        cell.tableTextFieldValue.tag = indexPath.row
        
        cell.tableFieldString.text = self.tableCellLabels[indexPath.row]
        
        return cell
        
}
    
    override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView?{
        
        return self.footerView;
    }
    
    override func tableView(tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat{
    
        return self.footerView.frame.height
    }
    
    
    // MARK:- Input Accesory Actions
    
    
    @IBAction func previousBtnAction(sender: AnyObject) {
    
        
        let pressedTextField:UITextField = self.activeTextField
        
        let indexPath = NSIndexPath(forRow: (pressedTextField.tag-1), inSection: 0)
        
        let prvTextCell:LabelTableViewCell = self.tableView.cellForRowAtIndexPath(indexPath) as! LabelTableViewCell
        
        prvTextCell.tableTextFieldValue.becomeFirstResponder()
        self.nxtBarButton.enabled = true
        
    }
    
    
    
    @IBAction func nextBtnAction(sender: AnyObject) {
        
        let pressedTextField:UITextField = self.activeTextField
        let indexPath = NSIndexPath(forRow: (pressedTextField.tag+1), inSection: 0)
        
        let nxtTextCell:LabelTableViewCell = self.tableView.cellForRowAtIndexPath(indexPath) as! LabelTableViewCell
        
        nxtTextCell.tableTextFieldValue.becomeFirstResponder()
        
        self.prvBarButton.enabled = true

        
    }
 
    @IBAction func doneAction(sender: AnyObject) {
        
        self.view.endEditing(true)
        
    }
    // MARK: - TextField Delegates
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        if(textField.tag<6){
           self.txtFields[textField.tag+1].becomeFirstResponder()
            
        }
        else if(textField.tag == 6){
            
            self.txtFields[textField.tag].becomeFirstResponder()
        }
        
        textField.resignFirstResponder()
        return true;
    }
    
    func textFieldDidBeginEditing(textField: UITextField){
        
      self.activeTextField = textField
    
        if(textField.tag == 0){
           
            self.prvBarButton.enabled = false
            
        }
        else if(textField.tag==6){
         self.nxtBarButton.enabled = false
        }
    }
    
    
    
    @IBAction func registerBtnTapped(sender: AnyObject) {
        
        registeration()
    }
    func registeration(){
        
        var indexPath = NSIndexPath(forRow: (0), inSection: 0)
        
        let emailTxtCell:LabelTableViewCell = self.tableView.cellForRowAtIndexPath(indexPath) as! LabelTableViewCell
        let emailTxt:String = emailTxtCell.tableTextFieldValue.text!
        
        var parameters:[String:String]=["email":emailTxt]
        
        
        indexPath = NSIndexPath(forRow: (indexPath.row+1), inSection: 0)
        let passCell:LabelTableViewCell = self.tableView.cellForRowAtIndexPath(indexPath) as! LabelTableViewCell
        let passTxt:String = passCell.tableTextFieldValue.text!
        
        parameters["pwd"]=passTxt
        
        indexPath = NSIndexPath(forRow: (indexPath.row+1), inSection: 0)
        let firstNameCell:LabelTableViewCell = self.tableView.cellForRowAtIndexPath(indexPath) as! LabelTableViewCell
        let firstNameTxt:String = firstNameCell.tableTextFieldValue.text!
        
        parameters["firstname"]=firstNameTxt
        
        indexPath = NSIndexPath(forRow: (indexPath.row+1), inSection: 0)
        let lastNameCell:LabelTableViewCell = self.tableView.cellForRowAtIndexPath(indexPath) as! LabelTableViewCell
        let lastNameTxt:String = lastNameCell.tableTextFieldValue.text!
        
        parameters["lastname"]=lastNameTxt
        
        indexPath = NSIndexPath(forRow: (indexPath.row+1), inSection: 0)
        let genderCell:LabelTableViewCell = self.tableView.cellForRowAtIndexPath(indexPath) as! LabelTableViewCell
        let genderTxt:String = genderCell.tableTextFieldValue.text!
        
        parameters["gender"]=genderTxt
        
        indexPath = NSIndexPath(forRow: (indexPath.row+1), inSection: 0)
        let raceCell:LabelTableViewCell = self.tableView.cellForRowAtIndexPath(indexPath) as! LabelTableViewCell
        let raceTxt:String = raceCell.tableTextFieldValue.text!
        
        parameters["race"]=raceTxt
        
        indexPath = NSIndexPath(forRow: (indexPath.row+1), inSection: 0)
        let maritalCell:LabelTableViewCell = self.tableView.cellForRowAtIndexPath(indexPath) as! LabelTableViewCell
        let maritalTxt:String = maritalCell.tableTextFieldValue.text!
        
        parameters["maritalstatus"]=maritalTxt
        
        
        Alamofire.Manager.sharedInstance.request(.POST, kRegistrationKey, parameters:parameters).validate()
            .responseJSON { response  in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                surveryList = [SurveyDetailsModel]()
                
                switch response.result {
                    
                    
                case .Success(let data):
                    let json = JSON(data)
                    print(json)
                    
                    let statuscode = json["status"]
                    
                    if(statuscode==1){
                       
                        let myViewController = mraStoryboard.instantiateViewControllerWithIdentifier("MyInfoViewController")
                        self.navigationController?.pushViewController(myViewController, animated: true)

                    }
                    else{
                        
                        let alert = UIAlertController(title: "Alert", message: "Something went wrong", preferredStyle: UIAlertControllerStyle.Alert)
                        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.Default, handler: nil))
                        self.presentViewController(alert, animated: true, completion: nil)
                    }
                    
                    
                case .Failure(let error):
                    print("Request failed with error: \(error)")
                }
                
                
        }
        
        
        
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