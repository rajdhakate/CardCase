//
//  Utility.swift
//  CardCase
//
//  Created by Raj Dhakate on 10/02/18.
//  Copyright © 2018 Dhakate Codes. All rights reserved.
//

import UIKit

class Utility: NSObject {

    class func screenHeight() -> CGFloat {
        return UIScreen.main.bounds.height
    }
    
    class func screenWidth() -> CGFloat {
        return UIScreen.main.bounds.width
    }
    
    class func validateRedColor() -> UIColor {
        return UIColor(red: 229.0/255.0, green: 96.0/255.0, blue: 96.0/255.0, alpha: 1.0)
    }
    
    class func validateGreenColor() -> UIColor {
        return UIColor(red: 105/255.0, green: 219/255.0, blue: 74/255.0, alpha: 1.0)
    }
}
