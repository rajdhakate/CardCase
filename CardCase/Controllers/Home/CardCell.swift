//
//  CardCell.swift
//  CardCase
//
//  Created by Raj Dhakate on 27/02/18.
//  Copyright © 2018 Dhakate Codes. All rights reserved.
//

import UIKit

class CardCell: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        bgView.layer.cornerRadius = 6
        bgView.layer.shadowColor = UIColor.black.cgColor
        bgView.layer.shadowOffset = CGSize(width: 0, height: 0)
        bgView.layer.shadowRadius = 5
        bgView.layer.shadowOpacity = 0.8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
