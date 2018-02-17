//
//  LoginFBField.swift
//  CardCase
//
//  Created by Raj Dhakate on 11/02/18.
//  Copyright © 2018 Dhakate Codes. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class LoginFBField: UITableViewCell {
    
    @IBOutlet weak var facebookButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        facebookButton.layer.cornerRadius = 3
//        facebookButton.layer.shadowColor = UIColor.lightGray.cgColor
//        facebookButton.layer.shadowOffset = CGSize(width: 0, height: 0)
//        facebookButton.layer.shadowRadius = 5
//        facebookButton.layer.shadowOpacity = 0.8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        facebookButton = nil
    }
    
}
