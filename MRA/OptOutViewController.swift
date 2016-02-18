//
//  OptOutViewController.swift
//  MRA
//
//  Created by Bharath Kongara on 11/10/15.
//  Copyright © 2015 Bharath Kongara. All rights reserved.
//

import UIKit

class OptOutViewController: UIViewController {

    
    
    @IBOutlet weak var txtViewReason: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.txtViewReason.layer.borderWidth = 1
        self.txtViewReason.layer.borderColor = UIColor.blackColor().CGColor
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func btnOptOutTapped(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
        
    }
}
