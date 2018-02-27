//
//  AppUtility.swift
//  CardCase
//
//  Created by Raj Dhakate on 27/02/18.
//  Copyright © 2018 Dhakate Codes. All rights reserved.
//

import UIKit

class AppUtility: NSObject {

}

extension UINavigationController {
    func textColor() {
        self.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.gray]
    }
}
