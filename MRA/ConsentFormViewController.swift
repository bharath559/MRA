//
//  ConsentFormViewController.swift
//  MRA
//
//  Created by Bharath Kongara on 11/10/15.
//  Copyright © 2015 Bharath Kongara. All rights reserved.
//

import UIKit

class ConsentFormViewController: UIViewController {

    @IBOutlet weak var pdfWebView: UIWebView!
    
    var selectedSurvey = SurveyDetailsModel(title: "",description: "",url: "",surveyId: 0,email: "",enrollStartDate: "",enrollEndDate: "",notificationFrequency: "")

    override func viewDidLoad() {
        super.viewDidLoad()
       loadSurveyPDF()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func loadSurveyPDF(){
        
        let url = NSURL (string: "http://www.cs.odu.edu/~bkongara/sample.pdf");
        let requestObj = NSURLRequest(URL: url!);
        self.pdfWebView.loadRequest(requestObj);
        
    }
    
    

    @IBAction func btnDisagreeTapped(sender: AnyObject) {
        
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
    @IBAction func btnAcceptTapped(sender: AnyObject) {
        let alert = UIAlertController(title: "Confirm", message: "In Order to participate in the survey, you must agree to the consent form, Click ok to agree or click cancel to try again", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { action in
            switch action.style{
            case .Default:
                surveyModel.isEnrolled = true
                self.navigationController?.popViewControllerAnimated(true)
            case .Cancel:
                print("cancel")
                
            case .Destructive:
                print("destructive")
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: { action in
            switch action.style{
            case .Default:
                print("default")
                
            case .Cancel:
                print("cancel")
                
            case .Destructive:
                print("destructive")
            }
        }))
        
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
