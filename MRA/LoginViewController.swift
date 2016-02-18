//
//  ViewController.swift
//  MRA
//
//  Created by Bharath Kongara on 11/8/15.
//  Copyright © 2015 Bharath Kongara. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTxtField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.emailTxtField.delegate = self
        self.passTxtField.delegate = self
               // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet weak var passTxtField: UITextField!

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
    }
    
  
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {   //delegate method
        
        if(textField.tag == 1){
            textField.resignFirstResponder()
            self.passTxtField.becomeFirstResponder()
        }
        else{
            textField.resignFirstResponder()
        }
        
        return true
    }

    @IBAction func loginBtnTapped(sender: AnyObject) {
        
        let parameters:[String:String]=["email":self.emailTxtField.text!,"pwd":self.passTxtField.text!]
        
        Alamofire.Manager.sharedInstance.request(.POST, kLoginServiceKey, parameters:parameters).validate()
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
                    
                    
                    if(statuscode == "success"){
                        
                        let userDetails = json["user"]
                        let firstName = userDetails["firstname"].stringValue
                        let lastname = userDetails["lastname"].stringValue
                        let emailId = userDetails["email"].stringValue
                        
                        let userProfile = UserProfile.sharedInstance
                        
                        userProfile.emailId=emailId
                        userProfile.firstName = firstName
                        userProfile.lastName = lastname
                        
                        let myViewController = mraStoryboard.instantiateViewControllerWithIdentifier("MyInfoViewController")
                        self.navigationController?.pushViewController(myViewController, animated: true)
                        
                        
                    }
                    else{
                        
                        
                        
                        
                    }
                    
                    
                case .Failure(let error):
                    print("Request failed with error: \(error)")
                
                
                }
              
            }
    
    }

}