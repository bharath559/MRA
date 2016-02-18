//
//  LabelTableViewCell.swift
//  MRA
//
//  Created by Bharath Kongara on 11/8/15.
//  Copyright © 2015 Bharath Kongara. All rights reserved.
//

import UIKit

class LabelTableViewCell: UITableViewCell {

    @IBOutlet weak var tableFieldString: UILabel!
    
    @IBOutlet weak var tableFieldValue: UILabel!
    
    @IBOutlet weak var tableTextFieldValue: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


}
