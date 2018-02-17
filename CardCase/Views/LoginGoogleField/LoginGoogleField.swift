//
//  LoginGoogleField.swift
//  CardCase
//
//  Created by Raj Dhakate on 11/02/18.
//  Copyright © 2018 Dhakate Codes. All rights reserved.
//

import UIKit
import GoogleSignIn

class LoginGoogleField: UITableViewCell {

    @IBOutlet weak var googleButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        googleButton.layer.cornerRadius = 3
        googleButton.layer.shadowColor = UIColor.lightGray.cgColor
        googleButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        googleButton.layer.shadowRadius = 5
        googleButton.layer.shadowOpacity = 0.8
        googleButton.layer.borderWidth = 1
        googleButton.layer.borderColor = UIColor.lightGray.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
