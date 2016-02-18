//
//  SurveyDetailsViewController.swift
//  MRA
//
//  Created by Bharath Kongara on 11/10/15.
//  Copyright © 2015 Bharath Kongara. All rights reserved.
//

import UIKit

class SurveyDetailsViewController: UIViewController {

    
    @IBOutlet weak var lblSurveyTitle: UILabel!
    @IBOutlet weak var lblEnrollStartDate: UILabel!
    
    @IBOutlet weak var txtNotificationFrequency: UITextView!
    @IBOutlet weak var txtDescription: UITextView!
    @IBOutlet weak var lblEnrollEndDate: UILabel!
    @IBOutlet weak var btnEnroll: UIButton!
    @IBOutlet weak var btnWithdraw: UIButton!
    
    var enrollStartDate:String = ""
    var enrollEndDate:String  = ""
    var selectedSurvey = SurveyDetailsModel(title: "",description: "",url: "",surveyId: 0,email: "",enrollStartDate: "",enrollEndDate: "",notificationFrequency: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
     
        
        self.lblEnrollEndDate.text = "Survey Start Date :"+self.selectedSurvey.enrollStartDate
        
        self.lblEnrollStartDate.text = "Survey End Date: "+self.selectedSurvey.enrollEndDate
        
        self.txtDescription.text = "Summary: "+self.selectedSurvey.description
        
        self.txtNotificationFrequency.text = "Notification Frequency: "+self.selectedSurvey.notificationFrequency
        
     
        self.lblSurveyTitle.text = self.selectedSurvey.title
        if(surveyModel.isEnrolled){
            
            btnWithdraw.alpha = 1;
            btnWithdraw.userInteractionEnabled = true
            btnEnroll.userInteractionEnabled = false;
            btnEnroll.alpha = 0;
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    @IBAction func btnDoneTapped(sender: AnyObject) {
        
        surveyModel.isEnrolled = false
        self.navigationController?.popViewControllerAnimated(true)
    }
  
    @IBAction func btnExitTapped(sender: AnyObject) {
      self.navigationController?.popToRootViewControllerAnimated(true)  
    
    }
    
    // MARK: - Navigation

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "ConsentForm"{
            
            let enrollViewController = segue.destinationViewController as! ConsentFormViewController
            enrollViewController.selectedSurvey = self.selectedSurvey
            
        }
    }
    

}
