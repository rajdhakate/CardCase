//
//  AccountCell.swift
//  CardCase
//
//  Created by Raj Dhakate on 27/02/18.
//  Copyright © 2018 Dhakate Codes. All rights reserved.
//

import UIKit

class AccountCell: UITableViewCell {
    
    @IBOutlet weak var bgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        bgView.layer.cornerRadius = 10
        bgView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
