//
//  LoginTextField.swift
//  CardCase
//
//  Created by Raj Dhakate on 09/02/18.
//  Copyright © 2018 Dhakate Codes. All rights reserved.
//

import UIKit

enum FieldValidate {
    case valid
    case invalid
    case empty
}

class LoginTextField: UITableViewCell {
    
    var fieldModel: LoginTextModel = LoginTextModel(id: "", placeholder: "", value: nil, valid: .empty, icon: nil) {
        didSet {
            reloadCell()
        }
    }

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var iconViewWidth: NSLayoutConstraint!
    @IBOutlet weak var adjustIconFieldSpace: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func reloadCell() {
        if fieldModel.value == nil {
            textField.placeholder = fieldModel.placeholder
        } else {
            textField.text = fieldModel.value
        }
        if fieldModel.icon == nil {
            iconViewWidth.constant = 0
            adjustIconFieldSpace.constant = 0
        } else {
            iconView.image = UIImage(named: fieldModel.icon!)
        }
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 3
        switch fieldModel.valid {
        case .empty:
            textField.layer.borderColor = UIColor.lightGray.cgColor
        case .valid:
            textField.layer.borderColor = Utility.validateGreenColor().cgColor
        case .invalid:
            textField.layer.borderColor = Utility.validateRedColor().cgColor
        case .none:
            textField.layer.borderColor = UIColor.lightGray.cgColor
        case .some(_):
            textField.layer.borderColor = UIColor.lightGray.cgColor
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        iconView = nil
        textField = nil
    }
}
