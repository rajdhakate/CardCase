//
//  LoginTextModel.swift
//  CardCase
//
//  Created by Raj Dhakate on 11/02/18.
//  Copyright © 2018 Dhakate Codes. All rights reserved.
//

import Foundation

struct LoginTextModel {
    var id: String!
    var placeholder: String!
    var value: String?
    var valid: FieldValidate!
    var icon: String?
    
    init(id: String!, placeholder: String!, value: String?, valid: FieldValidate!, icon: String?) {
        self.id = id
        self.placeholder = placeholder
        self.value = value
        self.valid = valid
        self.icon = icon
    }
}
